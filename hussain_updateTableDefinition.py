import psycopg2

def connect_to_database():
    conn = psycopg2.connect(
        host="127.0.0.1",
        database="spriced3",
        user="postgres",
        password="mysecretpassword"
    )
    return conn

def alter_table_column_definition(table_name, column_name, new_data_type, new_precision=None, new_scale=None, new_max_length=None):
    conn = connect_to_database()
    cursor = conn.cursor()
    
    try:
        # Step 1: Drop the dependent view
        drop_view_query = f"DROP VIEW IF EXISTS view_{table_name};"
        cursor.execute(drop_view_query)
        conn.commit()
        
        # Step 2: Alter the column type
        if new_data_type.startswith("numeric"):
            if new_precision is not None and new_scale is not None:
                alter_column_query = f"ALTER TABLE {table_name} ALTER COLUMN {column_name} TYPE {new_data_type}({new_precision},{new_scale});"
            else:
                alter_column_query = f"ALTER TABLE {table_name} ALTER COLUMN {column_name} TYPE {new_data_type};"
        elif new_data_type.startswith("character"):
            if new_max_length is not None:
                alter_column_query = f"ALTER TABLE {table_name} ALTER COLUMN {column_name} TYPE {new_data_type}({new_max_length});"
            else:
                alter_column_query = f"ALTER TABLE {table_name} ALTER COLUMN {column_name} TYPE {new_data_type};"
        else:
            print("Unsupported data type.")
            return
        
        cursor.execute(alter_column_query)
        conn.commit()
        
        # Step 3: Recreate the view
        recreate_view_query = f"CREATE VIEW view_{table_name} AS SELECT * FROM {table_name};"
        cursor.execute(recreate_view_query)
        conn.commit()
        
        print("Table definition altered successfully.")
    except psycopg2.Error as e:
        print(f"Error: {e}")
    finally:
        cursor.close()
        conn.close()

# # Example usage:
# table_name = "currency"
# column_name = "fx"
# new_data_type = "numeric"
# new_precision = 63
# new_scale = 2

# alter_table_column_definition(table_name, column_name, new_data_type, new_precision=new_precision, new_scale=new_scale)

# For character data type:
table_name_char = "currency"
column_name_char = "fx"
new_data_type_char = "character varying"
new_max_length_char = 25

alter_table_column_definition(table_name_char, column_name_char, new_data_type_char, new_max_length=new_max_length_char)
