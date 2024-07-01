import json
import pandas as pd
from sqlalchemy import create_engine

# Load the configuration from the JSON file
with open('config.json', 'r') as config_file:
    config = json.load(config_file)

column_name = config['column_name']
referred_table = config['referred_table']

# Read the part_regional CSV file, only selecting necessary columns
part_regional_df = pd.read_csv('part_regional.csv', usecols=[column_name, 'prod_cd3'])

# Database connection details
host = "127.0.0.1"
port = 5434
db_name = "spriced_meritor"
user = "postgres"
password = "mysecretpassword"

# Create a connection to the PostgreSQL database
engine = create_engine(f'postgresql+psycopg2://{user}:{password}@{host}:{port}/{db_name}')

# Read the referred table into a DataFrame
referred_table_df = pd.read_sql(f'SELECT * FROM {referred_table}', engine)

# Merge part_regional_df with referred_table_df on the specified column and code
updated_df = part_regional_df.merge(referred_table_df, left_on=column_name, right_on='code', how='left')

# Update the specified column with the id from the referred table
updated_df[column_name] = updated_df['id']

# Drop unnecessary columns
columns_to_drop = ['code', 'name', 'id', 'updated_by', 'updated_date', 'validationstatus', 'is_valid', 'created_date', 'created_by', 'comment', 'cbseg']
updated_df = updated_df.drop(columns=[col for col in columns_to_drop if col in updated_df.columns])

# Drop any "Unnamed" columns that may have been added during the CSV read
updated_df = updated_df.loc[:, ~updated_df.columns.str.contains('^Unnamed')]

# Save the updated DataFrame back to a CSV file
updated_df.to_csv('updated_part_regional.csv', index=False)
