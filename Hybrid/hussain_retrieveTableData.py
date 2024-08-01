import pandas as pd
from sqlalchemy import create_engine

def connect_to_database():
    # Using SQLAlchemy's create_engine for connection
    engine = create_engine('postgresql+psycopg2://postgres:mysecretpassword@172.28.234.94/spriced_meritor')
    return engine

def fetch_data_to_csv(table_name, csv_file_path):
    try:
        # Connect to the database
        engine = connect_to_database()
        
        # Define the SQL query
        query = f"SELECT * FROM {table_name}"
        
        # Use pandas to execute the query and read the data into a DataFrame
        df = pd.read_sql_query(query, engine)
        
        # Write the DataFrame to a CSV file
        df.to_csv(csv_file_path, index=False)
        
        print(f"Data from table '{table_name}' has been written to '{csv_file_path}' successfully.")
    
    except Exception as e:
        print(f"An error occurred: {e}")

# Usage example
fetch_data_to_csv('coninv', 'coninv.csv')
