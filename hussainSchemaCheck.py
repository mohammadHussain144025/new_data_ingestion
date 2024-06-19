import psycopg2

def connect_to_database(host, database, user, password):
    conn = psycopg2.connect(
        host=host,
        database=database,
        user=user,
        password=password)
    return conn

def get_table_names(conn):
    cursor = conn.cursor()
    try:
        cursor.execute("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'")
        return [row[0] for row in cursor.fetchall()]
    except Exception as e:
        print(f"Error: {e}")
        return []
    finally:
        cursor.close()

def get_table_columns(conn, table_name):
    cursor = conn.cursor()
    try:
        cursor.execute(f"SELECT column_name, data_type FROM information_schema.columns WHERE table_name = '{table_name}'")
        return cursor.fetchall()
    except Exception as e:
        print(f"Error: {e}")
        return []
    finally:
        cursor.close()

def compare_schemas(conn1, conn2):
    tables1 = get_table_names(conn1)
    tables2 = get_table_names(conn2)

    common_tables = set(tables1) & set(tables2)

    differences = {}

    for table in common_tables:
        columns1 = get_table_columns(conn1, table)
        columns2 = get_table_columns(conn2, table)

        if columns1 != columns2:
            differences[table] = {
                'schema1': columns1,
                'schema2': columns2
            }

    return differences

def main():
    try:
        # Connect to both databases
        conn1 = connect_to_database("127.0.0.1", "spriced", "postgres", "mysecretpassword")
        conn2 = connect_to_database("127.0.0.1", "spriced_meritor", "postgres", "mysecretpassword")

        # Compare schemas
        schema_differences = compare_schemas(conn1, conn2)

        # Print differences
        if schema_differences:
            print("Differences in schemas:")
            for table, diff in schema_differences.items():
                print(f"Table: {table}")
                print(f"Schema in database 1: {diff['schema1']}")
                print(f"Schema in database 2: {diff['schema2']}")
                print()
        else:
            print("No differences found in schemas.")

    except Exception as e:
        print(f"Error: {e}")

    finally:
        if conn1 is not None:
            conn1.close()
        if conn2 is not None:
            conn2.close()

if __name__ == "__main__":
    main()
