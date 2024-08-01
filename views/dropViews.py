import psycopg2

# # Database connection details
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

    # Function to get all views in the database
    def get_views():
        cur.execute("""
            SELECT table_schema, table_name
            FROM information_schema.views
            WHERE table_schema NOT IN ('pg_catalog', 'information_schema');
        """)
        return cur.fetchall()

    # Function to get all materialized views in the database
    def get_materialized_views():
        cur.execute("""
            SELECT schemaname, matviewname
            FROM pg_matviews;
        """)
        return cur.fetchall()

    # Function to drop a view
    def drop_view(schema, view_name):
        try:
            cur.execute(f'DROP VIEW IF EXISTS {schema}.{view_name} CASCADE;')
            conn.commit()
            print(f"Successfully dropped view {schema}.{view_name}")
        except Exception as e:
            conn.rollback()
            print(f"Error dropping view {schema}.{view_name}: {e}")

    # Function to drop a materialized view
    def drop_materialized_view(schema, view_name):
        try:
            cur.execute(f'DROP MATERIALIZED VIEW IF EXISTS {schema}.{view_name} CASCADE;')
            conn.commit()
            print(f"Successfully dropped materialized view {schema}.{view_name}")
        except Exception as e:
            conn.rollback()
            print(f"Error dropping materialized view {schema}.{view_name}: {e}")

    # Get all views and drop them
    views = get_views()
    for schema, view_name in views:
        print(f"Attempting to drop view: {schema}.{view_name}")
        drop_view(schema, view_name)

    # Get all materialized views and drop them
    materialized_views = get_materialized_views()
    for schema, view_name in materialized_views:
        print(f"Attempting to drop materialized view: {schema}.{view_name}")
        drop_materialized_view(schema, view_name)

    # Verify views are dropped
    remaining_views = get_views()
    if not remaining_views:
        print("All views successfully dropped.")
    else:
        print("Remaining views:", remaining_views)

    remaining_materialized_views = get_materialized_views()
    if not remaining_materialized_views:
        print("All materialized views successfully dropped.")
    else:
        print("Remaining materialized views:", remaining_materialized_views)

    # Close the cursor and connection
    cur.close()
    conn.close()

except psycopg2.OperationalError as e:
    print(f"OperationalError: {e}")
except Exception as e:
    print(f"An error occurred: {e}")
