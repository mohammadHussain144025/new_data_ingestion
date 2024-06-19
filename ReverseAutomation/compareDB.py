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
engine2 = create_engine(f"postgresql://{db2['user']}:{db2['password']}@{db2['host']}:{db2['port']}/{db2['database']}")

# Query to get schema information
query = """
SELECT table_name, column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'public'
ORDER BY table_name, column_name;
"""

# Fetch schema information
df1 = pd.read_sql_query(query, engine1)
df2 = pd.read_sql_query(query, engine2)

# Rename the data_type columns to include the database name
df1 = df1.rename(columns={'data_type': f"{db1['database']}_datatype"})
df2 = df2.rename(columns={'data_type': f"{db2['database']}_datatype"})

# Merge dataframes on table_name and column_name
merged = df1.merge(df2, on=['table_name', 'column_name'], how='outer', indicator=True)

# Identify differences
extra_columns = merged[merged['_merge'] != 'both']
type_differences = merged[(merged['_merge'] == 'both') & (merged[f"{db1['database']}_datatype"] != merged[f"{db2['database']}_datatype"])]

# Print results
print("Extra Columns:")
print(extra_columns)

print("\nType Differences:")
print(type_differences)
