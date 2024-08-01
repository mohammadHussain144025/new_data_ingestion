import os
import psycopg2
import pandas as pd
import re

# Connection details
host = "172.28.234.94"
database = "test"
user = "postgres"
password = "mysecretpassword"

# Directories to save the scripts
view_directory = "list_views_scripts"
mv_directory = "list_mv_views_scripts"

# Create the directories if they don't exist
os.makedirs(view_directory, exist_ok=True)
os.makedirs(mv_directory, exist_ok=True)

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

def fetch_views_from_db():
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
        conn.autocommit = True
        cur = conn.cursor()
        
        # Query to get all regular views definitions
        cur.execute("""
            SELECT n.nspname AS schemaname,
                   c.relname AS viewname,
                   pg_catalog.pg_get_viewdef(c.oid, true) AS definition
            FROM pg_class c
            JOIN pg_namespace n ON n.oid = c.relnamespace
            WHERE c.relkind = 'v'
        """)
        
        # Fetch all regular view definitions
        views = cur.fetchall()
        
        # Query to get all materialized views definitions
        cur.execute("""
            SELECT n.nspname AS schemaname,
                   c.relname AS viewname,
                   pg_catalog.pg_get_viewdef(c.oid, true) AS definition
            FROM pg_class c
            JOIN pg_namespace n ON n.oid = c.relnamespace
            WHERE c.relkind = 'm'
        """)
        
        # Fetch all materialized view definitions
        materialized_views = cur.fetchall()

        # Create DataFrame for views and materialized views
        df_views = pd.DataFrame(views, columns=['Schema Name', 'View Name', 'Definition'])
        df_materialized_views = pd.DataFrame(materialized_views, columns=['Schema Name', 'View Name', 'Definition'])
        
        return df_views, df_materialized_views

    except psycopg2.Error as e:
        print(f"Connection error: {e.pgcode} - {e.pgerror}")
        return pd.DataFrame(columns=['Schema Name', 'View Name', 'Definition']), pd.DataFrame(columns=['Schema Name', 'View Name', 'Definition'])
    finally:
        if cur:
            cur.close()
        if conn:
            conn.close()

def save_view_scripts(df_views, df_materialized_views):
    # Save each regular view's complete create script to a file
    for _, row in df_views.iterrows():
        schemaname, viewname, definition = row
        create_script = f"""
-- View: {schemaname}.{viewname}

-- DROP VIEW {schemaname}.{viewname};

CREATE OR REPLACE VIEW {schemaname}.{viewname} AS
{definition.strip()};

ALTER TABLE {schemaname}.{viewname}
    OWNER TO postgres;
        """
        file_path = os.path.join(view_directory, f"{viewname}_create_script.sql")
        with open(file_path, "w") as file:
            file.write(create_script)

    # Save each materialized view's complete create script to a file
    for _, row in df_materialized_views.iterrows():
        schemaname, viewname, definition = row
        create_script = f"""
-- Materialized View: {schemaname}.{viewname}

-- DROP MATERIALIZED VIEW {schemaname}.{viewname};

CREATE MATERIALIZED VIEW {schemaname}.{viewname} AS
{definition.strip()};

ALTER MATERIALIZED VIEW {schemaname}.{viewname}
    OWNER TO postgres;
        """
        file_path = os.path.join(mv_directory, f"{viewname}_create_script.sql")
        with open(file_path, "w") as file:
            file.write(create_script)

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
        conn.autocommit = True
        cur = conn.cursor()
        
        # Define the view name dynamically
        view_name = 'view_' + 'part_regional'
        drop_view_command = f"DROP VIEW IF EXISTS {view_name};"
        
        # Execute the DROP VIEW command
        print(f"Executing command:\n{drop_view_command}\n")
        try:
            cur.execute(drop_view_command)
            print("Command executed successfully.")
        except psycopg2.Error as e:
            # Print SQL query error
            error_message = e.pgerror
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
                # Store sorted view names in a list
                views_list = sorted_views
                
                # Store sorted view names in a Pandas DataFrame
                df_views = pd.DataFrame(views_list, columns=['View Name'])
                print("\nDataFrame with sorted view names:")
                print(df_views)
                
                return df_views
            else:
                print("No dependencies found.")
                return pd.DataFrame(columns=['View Name'])
        
    except psycopg2.Error as e:
        print(f"Connection error: {e.pgcode} - {e.pgerror}")
        return pd.DataFrame(columns=['View Name'])
    finally:
        # Close the cursor and connection
        if cur:
            cur.close()
        if conn:
            conn.close()

if __name__ == "__main__":
    # Execute DROP VIEW command and get the list of views
    df_views = execute_drop_view()
    
    # Fetch all views and materialized views from the database
    df_all_views, df_all_materialized_views = fetch_views_from_db()
    
    # Filter views and materialized views based on the list obtained from the DROP VIEW command
    df_filtered_views = df_all_views[df_all_views['View Name'].isin(df_views['View Name'])]
    df_filtered_materialized_views = df_all_materialized_views[df_all_materialized_views['View Name'].isin(df_views['View Name'])]
    
    # Save the view and materialized view scripts
    save_view_scripts(df_filtered_views, df_filtered_materialized_views)
