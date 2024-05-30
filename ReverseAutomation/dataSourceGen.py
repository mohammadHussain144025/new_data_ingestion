import psycopg2
import csv

def connect_to_database():
    conn = psycopg2.connect(
        host="127.0.0.1",
        database="spriced",
        user="postgres",
        password="mysecretpassword")
    return conn

def get_table_names(conn):
    cursor = conn.cursor()
    try:
        cursor.execute("SELECT name, display_name FROM entity")
        return cursor.fetchall()  # Fetch both table name and display name
    except Exception as e:
        print(f"Error: {e}")
        return []
    finally:
        cursor.close()

def get_table_details(conn, table_name):
    cursor = conn.cursor()
    try:
        cursor.execute(f"SELECT column_name, data_type, character_maximum_length, numeric_precision, numeric_scale FROM information_schema.columns WHERE table_name = '{table_name}'")
        table_details = cursor.fetchall()
        return table_details
    except Exception as e:
        print(f"Error: {e}")
        return None
    finally:
        cursor.close()

def format_data_type(data_type, max_length, precision, scale):
    if data_type in ['integer', 'bigint']:
        data_type = 'numeric'
        size = precision
        pos = str(scale) if scale is not None else ""
    elif data_type == 'numeric':
        data_type = 'decimal'
        size = precision
        pos = str(scale) if scale is not None else ""
    elif data_type == 'timestamp with time zone':
        data_type = 'datetime'
        size = None
        pos = None
    elif data_type == 'character varying':
        data_type = 'char'
        size = max_length
        pos = None
    else:
        size = None
        pos = None
    return data_type, size, pos

def is_not_null(conn, table_name, column_name):
    cursor = conn.cursor()
    try:
        cursor.execute(f"SELECT is_nullable FROM information_schema.columns WHERE table_name = '{table_name}' AND column_name = '{column_name}'")
        result = cursor.fetchone()
        if result:
            return result[0] == 'NO'
        else:
            print(f"Column '{column_name}' not found in table '{table_name}'.")
            return False
    except Exception as e:
        print(f"Error: {e}")
        return False
    finally:
        cursor.close()

def is_foreign_key(conn, table_name, column_name):
    cursor = conn.cursor()
    try:
        cursor.execute(f"SELECT COUNT(*) FROM information_schema.key_column_usage WHERE table_name = '{table_name}' AND column_name = '{column_name}'")
        result = cursor.fetchone()
        return result[0] > 0
    except Exception as e:
        print(f"Error: {e}")
        return False
    finally:
        cursor.close()

def get_referenced_table(conn, table_name, column_name):
    cursor = conn.cursor()
    try:
        cursor.execute(f"SELECT ccu.table_name FROM information_schema.key_column_usage kc JOIN information_schema.table_constraints tc ON kc.constraint_name = tc.constraint_name JOIN information_schema.constraint_column_usage ccu ON tc.constraint_name = ccu.constraint_name WHERE kc.table_name = '{table_name}' AND kc.column_name = '{column_name}' AND tc.constraint_type = 'FOREIGN KEY'")
        result = cursor.fetchone()
        if result:
            return result[0]
        else:
            return ""
    except Exception as e:
        print(f"Error: {e}")
        return ""
    finally:
        cursor.close()

def main():
    try:
        conn = connect_to_database()
        table_names_with_display_names = get_table_names(conn)  # Fetch table names and display names
        if table_names_with_display_names:
            with open("all_tables_generated_definition.csv", mode='w', newline='') as file:
                writer = csv.writer(file)
                writer.writerow(['SPRICED_TABLE_NAME', 'Table_Display_Name', 'TABLE_SCHEMA', 'COLUMN_NAME', 'DISPLAY_NAME', 'DATA_TYPE', 'SIZE', 'POS', 'IS_NULLABLE', 'IS_REF_COLUMN', 'PRIMARY_KEY', 'AUTOGEN', 'Ref'])
                for table_name, display_name in table_names_with_display_names:  # Iterate over table names and display names
                    table_details = get_table_details(conn, table_name)
                    if table_details:
                        for column_name, data_type, max_length, precision, scale in table_details:
                            if column_name.lower() in ['id', 'updated_date', 'comment', 'updated_by', 'is_valid', 'created_date', 'created_by', 'validationstatus']:
                                continue
                            data_type, size, pos = format_data_type(data_type, max_length, precision, scale)
                            is_nullable = 'no' if is_not_null(conn, table_name, column_name) else 'yes'
                            referenced_table = get_referenced_table(conn, table_name, column_name)
                            is_ref_column = 'true' if referenced_table else 'false'
                            writer.writerow([table_name, display_name, 'spriced', column_name, '', data_type, size, pos, is_nullable, is_ref_column, '', '', referenced_table])
                    else:
                        print(f"Table details for '{table_name}' not found.")
            print("All table details written to all_tables_generated_definition.csv")
        else:
            print("No tables found.")
    except Exception as e:
        print(f"Error: {e}")
    finally:
        if conn is not None:
            conn.close()

if __name__ == "__main__":
    main()
