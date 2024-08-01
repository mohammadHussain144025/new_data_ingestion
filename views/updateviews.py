import os
import psycopg2

# # Database connection details
# host = "localhost"
# db_name = "spriced_meritor"
# user = "postgres"
# password = "mysecretpassword"
# port= 5434


# Database connection details local 
host = "localhost"
db_name = "spriced_meritor"
user = "postgres"
password = "mysecretpassword"
port= 5433


# # Database connection details
# host = "172.28.234.94"
# db_name = "spriced_meritor"
# user = "postgres"
# password = "mysecretpassword"
# port = 5432


# Directories containing the scripts
view_directory = "dev_view_scripts"
mv_directory = "dev_mv_views"

# Connect to the PostgreSQL database
try:
    conn = psycopg2.connect(
        host=host,
        database=db_name,
        user=user,
        password=password,
        port=port
    )
    cur = conn.cursor()

    # Function to execute a script from a file
    def execute_script_from_file(file_path):
        with open(file_path, 'r') as file:
            script = file.read()
            try:
                cur.execute(script)
                conn.commit()
                print(f"Successfully executed {file_path}")
            except Exception as e:
                conn.rollback()
                print(f"Error executing {file_path}: {e}")

    # Execute view scripts
    for script_file in os.listdir(view_directory):
        if script_file.endswith("_create_script.sql"):
            file_path = os.path.join(view_directory, script_file)
            execute_script_from_file(file_path)

    # Execute materialized view scripts
    for script_file in os.listdir(mv_directory):
        if script_file.endswith("_create_script.sql"):
            file_path = os.path.join(mv_directory, script_file)
            execute_script_from_file(file_path)

    # Close the cursor and connection
    cur.close()
    conn.close()

except psycopg2.OperationalError as e:
    print(f"OperationalError: {e}")
except Exception as e:
    print(f"An error occurred: {e}")
