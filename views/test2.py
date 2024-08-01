import psycopg2
import re
import pandas as pd

# Connection details
host = "172.28.234.94"
database = "test"
user = "postgres"
password = "mysecretpassword"

# Dynamic view name
view_name = 'view_' + 'part_regional'

# SQL Command
drop_view_command = f"DROP VIEW IF EXISTS {view_name};"

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
            # print(f"An error occurred: {e.pgcode} - {e.pgerror}")
            # print("Error Details:")
            error_message = e.pgerror
            # print(f"Error Message: {error_message}")
            # print(f"SQL State: {e.pgcode}")
            # print(f"Detail: {e.diag.message_detail}")
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
                
                sorted_views = sorted(all_views)
                # print("\nAll views and materialized views (sorted):")
                # for view in sorted_views:
                #     print(view)
                
                # Store sorted view names in a list
                views_list = sorted_views
                
                # Store sorted view names in a Pandas DataFrame
                df_views = pd.DataFrame(views_list, columns=['View Name'])
                print("\nDataFrame with sorted view names:")
                print(df_views)
                
                return views_list, df_views
            else:
                print("No dependencies found.")
                return [], pd.DataFrame(columns=['View Name'])
        
    except psycopg2.Error as e:
        print(f"Connection error: {e.pgcode} - {e.pgerror}")
        return [], pd.DataFrame(columns=['View Name'])
    finally:
        # Close the cursor and connection
        if cur:
            cur.close()
        if conn:
            conn.close()

if __name__ == "__main__":
    views_list, df_views = execute_drop_view()
