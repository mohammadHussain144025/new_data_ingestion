import os
import psycopg2

# Database connection details
# host = "172.28.234.94"
# db_name = "spriced_meritor"
# user = "postgres"
# password = "mysecretpassword"
# port = 5432

# Database connection details local 
host = "localhost"
db_name = "spriced_meritor"
user = "postgres"
password = "mysecretpassword"
port= 5433

# Directories containing the scripts
view_directory = "view_scripts"
mv_directory = "mv_views"

# List of views and materialized views to create
views_to_create = [
    "view_cust_impact_result_current_create_script.sql",
    "view_cust_impact_result_future_create_script.sql",
    # Add more view scripts as needed
]

materialized_views_to_create = [
    "mv_final_customer_impact_report_create_script.sql",
    "mv_sro_compliance_create_script.sql",
    # Add more materialized view scripts as needed
]

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

    # Function to create views from the specified scripts
    def create_views():
        for script_file in views_to_create:
            file_path = os.path.join(view_directory, script_file)
            execute_script_from_file(file_path)

    # Function to create materialized views from the specified scripts
    def create_materialized_views():
        for script_file in materialized_views_to_create:
            file_path = os.path.join(mv_directory, script_file)
            execute_script_from_file(file_path)

    # Create views and materialized views
    create_views()
    create_materialized_views()

    # Close the cursor and connection
    cur.close()
    conn.close()

except psycopg2.OperationalError as e:
    print(f"OperationalError: {e}")
except Exception as e:
    print(f"An error occurred: {e}")
