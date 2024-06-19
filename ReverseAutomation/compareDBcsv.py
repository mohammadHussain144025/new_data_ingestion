import pandas as pd
from sqlalchemy import create_engine

# Database connection details
db1 = {
    'database': 'spriced_meritor',
    'user': 'postgres',
    'password': 'mysecretpassword',
    'host': '172.28.234.94',
    'port': '5432'
}
db2 = {
    'database': 'spriced',
    'user': 'postgres',
    'password': 'mysecretpassword',
    'host': '172.28.234.94',
    'port': '5432'
}

# Create SQLAlchemy engines
engine1 = create_engine(f"postgresql://{db1['user']}:{db1['password']}@{db1['host']}:{db1['port']}/{db1['database']}")
engine2 = create_engine(f"postgresql://{db1['user']}:{db1['password']}@{db1['host']}:{db1['port']}/{db1['database']}")
# engine2 = create_engine(f"postgresql://{db2['user']}:{db2['password']}@{db2['host']}:{db2['port']}/{db2['database']}")

# Query to get tables from the entity table
entity_query = "SELECT name FROM entity"

# Fetch tables from the entity table
entity_df1 = pd.read_sql_query(entity_query, engine1)
entity_df2 = pd.read_sql_query(entity_query, engine2)

# List of tables to check
tables_to_check = set(entity_df1['name']).union(set(entity_df2['name']))

# Query to get schema information
schema_query = """
SELECT table_name, column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'public'
ORDER BY table_name, column_name;
"""

# Fetch schema information
df1 = pd.read_sql_query(schema_query, engine1)
df2 = pd.read_sql_query(schema_query, engine2)

# Filter schema information to include only tables listed in the entity table
df1 = df1[df1['table_name'].isin(tables_to_check)]
df2 = df2[df2['table_name'].isin(tables_to_check)]

# List of columns to exclude from comparison
columns_to_exclude = ['comment', 'created_by', 'id', 'is_valid', 'updated_date', 'updated_by', 'validationstatus']

# Filter out the excluded columns
df1 = df1[~df1['column_name'].isin(columns_to_exclude)]
df2 = df2[~df2['column_name'].isin(columns_to_exclude)]

# Rename the data_type columns to include the database name
df1 = df1.rename(columns={'data_type': f"{db1['database']}_datatype"})
df2 = df2.rename(columns={'data_type': f"{db2['database']}_datatype"})

# Merge dataframes on table_name and column_name
merged = df1.merge(df2, on=['table_name', 'column_name'], how='outer', indicator=True)

# Identify differences
extra_columns = merged[merged['_merge'] != 'both']
type_differences = merged[(merged['_merge'] == 'both') & (merged[f"{db1['database']}_datatype"] != merged[f"{db2['database']}_datatype"])]

# Save results to CSV files
extra_columns.to_csv('extra_columns.csv', index=False)
type_differences.to_csv('type_differences.csv', index=False)

print("Extra Columns:")
print(extra_columns)

print("\nType Differences:")
print(type_differences)
