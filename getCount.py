import psycopg2

def get_table_records(connection):
    table_records = {}
    cursor = connection.cursor()
    
    # Fetch all tables in the public schema
    cursor.execute("""
        SELECT table_name
        FROM information_schema.tables
        WHERE table_schema = 'public' AND table_type = 'BASE TABLE'
    """)
    tables = cursor.fetchall()
    
    # Fetch records from each table
    for table in tables:
        table_name = table[0]
        cursor.execute(f"SELECT count(*) FROM public.{table_name}")
        records = cursor.fetchall()
        table_records[table_name] = records
    
    cursor.close()
    return table_records

def main():
    conn = None  # Initialize conn to None
    try:
        # Connect to the PostgreSQL database
        conn = psycopg2.connect(
            dbname="spriced_meritor",
            user="postgres",
            password="mysecretpassword",
            host="127.0.0.1",
            port="5432"
        )
        
        # Retrieve records of all tables in the public schema
        table_records = get_table_records(conn)
        
        # Display records
        for table, records in table_records.items():
            print(f"'{table}':")
            for record in records:
                print(record)
            print()
            
    except psycopg2.Error as e:
        print("Error connecting to PostgreSQL database:", e)
    finally:
        if conn:
            conn.close()

if __name__ == "__main__":
    main()
