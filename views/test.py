import psycopg2
import re

# Connection details
host = "172.28.234.94"
database = "spriced_meritor"
user = "postgres"
password = "mysecretpassword"

# SQL Command
drop_view_command = """
DROP VIEW IF EXISTS view_part_regional;
"""

def parse_dependencies(error_message):
    # Regex pattern to extract dependencies
    pattern = re.compile(r'(materialized view|view) (\w+_\w+) depends on (materialized view|view) (\w+_\w+)')
    
    # Find all matches in the error message
    matches = pattern.findall(error_message)
    
    # Create a dictionary to hold dependencies
    dependencies = {}
    for match in matches:
        dependent_type, dependent_name, dependency_type, dependency_name = match
        if dependent_name not in dependencies:
            dependencies[dependent_name] = []
        dependencies[dependent_name].append(dependency_name)
    
    return dependencies

def execute_drop_view():
    conn = None
    cur = None
    try:
        # Connect to the PostgreSQL database
        conn = psycopg2.connect(
            host=host,
            database=database,
            user=user,
            password=password
        )
        conn.autocommit = True  # Enable autocommit for DDL commands
        cur = conn.cursor()
        
        # Execute the DROP VIEW command
        print(f"Executing command:\n{drop_view_command}\n")
        try:
            cur.execute(drop_view_command)
            print("Command executed successfully.")
        except psycopg2.Error as e:
            # Print SQL query error
            print(f"An error occurred: {e.pgcode} - {e.pgerror}")
            print("Error Details:")
            error_message = e.pgerror
            print(f"Error Message: {error_message}")
            print(f"SQL State: {e.pgcode}")
            print(f"Detail: {e.diag.message_detail}")
            print(f"Hint: {e.diag.message_hint}")
            
            # Parse and print dependencies
            dependencies = parse_dependencies(error_message)
            if dependencies:
                print("\nDependencies extracted from error detail:")
                for dependent, dependencies_list in dependencies.items():
                    for dependency in dependencies_list:
                        print(f"{dependent} is dependent upon {dependency}")
                
                # Print view names in ascending order
                all_views = set()
                for dependent, dependencies_list in dependencies.items():
                    all_views.add(dependent)
                    all_views.update(dependencies_list)
                
                print("\nAll views and materialized views (sorted):")
                for view in sorted(all_views):
                    print(view)
            else:
                print("No dependencies found.")
        
    except psycopg2.Error as e:
        print(f"Connection error: {e.pgcode} - {e.pgerror}")
    finally:
        # Close the cursor and connection
        if cur:
            cur.close()
        if conn:
            conn.close()

if __name__ == "__main__":
    execute_drop_view()
