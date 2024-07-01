import psycopg2
from psycopg2 import sql

# Database connection parameters
db_params = {
    "dbname": "spriced_meritor",
    "user": "postgres",
    "password": "mysecretpassword",
    "host": "localhost",
    "port": "5432",  # Default PostgreSQL port
}

try:
    # Connect to the PostgreSQL database
    connection = psycopg2.connect(**db_params)

    # Create a cursor object to interact with the database
    cursor = connection.cursor()

    # Get a list of all tables in the database
    cursor.execute(
        """
        SELECT table_name
        FROM information_schema.tables
        WHERE table_schema = 'public'
        """
    )
    table_names = cursor.fetchall()

    for table_name in table_names:
        table_name = table_name[0]
        # Build a SQL query to count the number of records in each table
        count_query = sql.SQL("SELECT COUNT(*) FROM {}").format(sql.Identifier(table_name))

        # Execute the count query
        cursor.execute(count_query)
        count = cursor.fetchone()[0]

        # Print the table name and record count
        print(f"{table_name}, {count}")

except (Exception, psycopg2.Error) as error:
    print("Error connecting to the PostgreSQL database:", error)
finally:
    # Close the database connection and cursor
    if connection:
        cursor.close()
        connection.close()
        print("Database connection closed.")
