import pandas as pd
import json
from sqlalchemy import create_engine

# Load the configuration from the JSON file
with open('myconfig.json', 'r') as config_file:
    config = json.load(config_file)

input_csv = config['input_csv']
output_csv = config['output_csv']
columns_config = config['columns']
date_columns = config.get('date_columns', [])
print(config)

customId = 1
customCode = 1
name = ''

# Read the part_regional CSV file and convert column names to lowercase
part_regional_df = pd.read_csv(input_csv)
part_regional_df.columns = part_regional_df.columns.str.lower()

print("\033[3;34mColumn headers converted to lower case ...\033[0m")

# Function to remove decimal point from strings representing floats
def remove_decimal(value):
    if isinstance(value, str) and '.' in value:
        parts = value.split('.')
        return parts[0]
    return value

# Database connection details
host = "127.0.0.1"
port = 5434
db_name = "spriced_meritor"
user = "postgres"
password = "mysecretpassword"

# Create a connection to the PostgreSQL database
engine = create_engine(f'postgresql+psycopg2://{user}:{password}@{host}:{port}/{db_name}')

# Iterate over each column configuration
for col_config in columns_config:
    column_name = col_config['column_name']
    referred_table = col_config['referred_table']

    print("\033[4;35mProcessing column_name: '{}', referred_table: '{}'\033[0m".format(column_name, referred_table))

    # Ensure the specified column is treated as a string
    part_regional_df[column_name] = part_regional_df[column_name].astype(str)

    # Apply the function to the specified column
    part_regional_df[column_name] = part_regional_df[column_name].apply(remove_decimal)

    # Read the referred table into a DataFrame
    referred_table_df = pd.read_sql(f'SELECT * FROM {referred_table}', engine)

    # Merge part_regional_df with referred_table_df on the specified column and code
    part_regional_df = part_regional_df.merge(referred_table_df, left_on=column_name, right_on='code', how='left')

    # Update the specified column with the id from the referred table
    part_regional_df[column_name] = part_regional_df['id']

    # Drop unnecessary columns
    columns_to_drop = ['code', 'name', 'id', 'updated_by', 'updated_date', 'validationstatus', 'is_valid', 'created_date', 'created_by', 'comment', 'cbseg']
    part_regional_df = part_regional_df.drop(columns=[col for col in columns_to_drop if col in part_regional_df.columns])

print("\033[3;4;35mMapping completed.!\033[0m")

# Drop any "Unnamed" columns that may have been added during the CSV read
part_regional_df = part_regional_df.loc[:, ~part_regional_df.columns.str.contains('^Unnamed')]

print('\033[3;36mAdding Column.....\033[0m')
# Add new 'id' column starting from customId
part_regional_df['id'] = range(customId, customId + len(part_regional_df))

# Add new 'code' column starting from customCode
part_regional_df['code'] = range(customCode, customCode + len(part_regional_df))

# Add new 'name' column with empty values
part_regional_df['name'] = name

print("\033[;36mAdded code, starting code from: {}\nAdded id, starting id from: {}\nAdded name {}\033[0m".format(customCode, customId, name))

# Rearrange columns to have 'id', 'name', 'code' as the first, second, and third columns
part_regional_df = part_regional_df[['id', 'name', 'code'] + [col for col in part_regional_df.columns if col not in ['id', 'name', 'code']]]

# Function to convert date columns to 'YYYY-MM-DD' format and print previous and current formats
def convert_date_columns(df, date_columns):
    for col in date_columns:
        if col in df.columns:
            print(f"Converting column: {col}")
            print(f"Previous date format in column '{col}':")
            print(df[col].head())

            # Attempt to convert the column to datetime with dayfirst=True for DD-MM-YYYY format
            df[col] = pd.to_datetime(df[col], dayfirst=True, errors='coerce').dt.strftime('%Y-%m-%d')

            print(f"Current date format in column '{col}':")
            print(df[col].head())

    return df

# Convert the listed date columns to 'YYYY-MM-DD' format after all mappings
print("date col : ",date_columns)
part_regional_df = convert_date_columns(part_regional_df, date_columns)

# Save the updated DataFrame back to a CSV file
part_regional_df.to_csv(output_csv, index=False)

# Print completion message
print("\033[3;32mOperation completed successfully..!\n\033[0m")
# Print log information about the output CSV filename
print("\033[1;33mOutput CSV file: {}\033[0m".format(output_csv))
