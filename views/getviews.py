import os
import psycopg2

# Database connection details local 
# host = "172.28.234.94"
# db_name = "spriced"
# user = "postgres"
# password = "mysecretpassword"
# port= 5432

# Database connection details local 
host = "localhost"
db_name = "spriced_meritor"
user = "postgres"
password = "mysecretpassword"
port= 5433

# # Database connection details uat
# host = "localhost"
# db_name = "spriced_meritor"
# user = "postgres"
# password = "mysecretpassword"
# port= 5434


# Directories to save the scripts
view_directory = "dev_view_scripts"
mv_directory = "dev_mv_views"

# Create the directories if they don't exist
os.makedirs(view_directory, exist_ok=True)
os.makedirs(mv_directory, exist_ok=True)

# Connect to the PostgreSQL database
conn = psycopg2.connect(
    host=host,
    database=db_name,
    user=user,
    password=password,
    port=port
)

# Create a cursor object
cur = conn.cursor()

# Query to get all regular views definitions
cur.execute("""
    SELECT v.schemaname, v.viewname, v.definition, r.rolname
    FROM pg_views v
    JOIN pg_class c ON c.relname = v.viewname
    JOIN pg_namespace n ON n.oid = c.relnamespace
    JOIN pg_roles r ON r.oid = c.relowner
    WHERE v.schemaname = 'public'
""")

# Fetch all regular view definitions
views = cur.fetchall()

# Save each regular view's complete create script to a file
for view in views:
    schemaname, viewname, definition, owner = view
    create_script = f"""
-- View: {schemaname}.{viewname}

-- DROP VIEW {schemaname}.{viewname};

CREATE OR REPLACE VIEW {schemaname}.{viewname} AS
{definition.strip()};

ALTER TABLE {schemaname}.{viewname}
    OWNER TO {owner};
    """
    # Remove leading/trailing whitespace from the entire script
    create_script = create_script.strip()

    # Save the script to a file in the view_scripts directory
    file_path = os.path.join(view_directory, f"{viewname}_create_script.sql")
    with open(file_path, "w") as file:
        file.write(create_script)

# Query to get all materialized views definitions
cur.execute("""
    SELECT n.nspname AS schemaname,
           c.relname AS viewname,
           pg_catalog.pg_get_viewdef(c.oid, true) AS definition
    FROM pg_class c
    JOIN pg_namespace n ON n.oid = c.relnamespace
    WHERE c.relkind = 'm'  -- 'm' for materialized views
""")

# Fetch all materialized view definitions
materialized_views = cur.fetchall()

# Check if any materialized views were fetched
if not materialized_views:
    print("No materialized views found or check permissions.")
else:
    print(f"Found {len(materialized_views)} materialized views.")

    # Save each materialized view's complete create script to a file
    for matview in materialized_views:
        schemaname, viewname, definition = matview

        # Debugging output
        print(f"Processing materialized view: {viewname}")

        create_script = f"""
-- Materialized View: {schemaname}.{viewname}

-- DROP MATERIALIZED VIEW {schemaname}.{viewname};

CREATE MATERIALIZED VIEW {schemaname}.{viewname} AS
{definition.strip()};

ALTER MATERIALIZED VIEW {schemaname}.{viewname}
    OWNER TO postgres;
        """
        # Remove leading/trailing whitespace from the entire script
        create_script = create_script.strip()

        # Save the script to a file in the mv_views directory
        file_path = os.path.join(mv_directory, f"{viewname}_create_script.sql")
        with open(file_path, "w") as file:
            file.write(create_script)

# Close the cursor and connection
cur.close()
conn.close()
