import psycopg2
import json

###############################################

# Define ANSI color escape codes
class Color:
    RESET = '\033[0m'
    RED = '\033[91m'
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    BLUE = '\033[94m'
    MAGENTA = '\033[95m'
    CYAN = '\033[96m'
    WHITE = '\033[97m'

# Function to print colored text
def print_color(text, color):
    print(color + text + Color.RESET)

# Example usage
print_color("This is red text", Color.WHITE)
print_color("This is green text", Color.MAGENTA)
print_color("This is blue text", Color.CYAN)

#################################################


def connect_to_database():
    conn = psycopg2.connect(
        host="127.0.0.1",
        database="spriced",
        user="postgres",
        password="mysecretpassword"
    )
    return conn

def load_table_info_from_json(file_path):
    with open(file_path, "r") as file:
        table_info = json.load(file)
    return table_info

def alter_table_column_definition(table_info, column_name, new_data_type, size=None, new_scale=None):
    conn = connect_to_database()
    cursor = conn.cursor()
    
    try:
        table_name = table_info["name"]
        
        # Step 1: Drop the dependent view
        drop_view_query = f"DROP VIEW IF EXISTS view_{table_name};"
        cursor.execute(drop_view_query)
        conn.commit()
        
        # Step 2: Alter the column type
        if new_data_type == "DECIMAL":
            if size is not None and new_scale is not None:
                new_precision, new_scale = int(prec), int(new_scale)
                alter_column_query = f"ALTER TABLE {table_name} ALTER COLUMN {column_name} TYPE numeric({new_precision},{new_scale});"
            else:
                print("Both size and numberOfDecimalValues are required for DECIMAL data type.")
                return
        elif new_data_type == "STRING_VAR":
            if size is not None:
                alter_column_query = f"ALTER TABLE {table_name} ALTER COLUMN {column_name} TYPE character varying({size});"
            else:
                print("Size is required for string data type.")
                return
        else:
            print_color(f"column Name : {{{column_name}}}  data type : {new_data_type} : size, precision & scale not needed!",Color.CYAN)
            return
        
        cursor.execute(alter_column_query)
        conn.commit()
        
        # Step 3: Recreate the view
        recreate_view_query = f"CREATE VIEW view_{table_name} AS SELECT * FROM {table_name};"
        cursor.execute(recreate_view_query)
        conn.commit()
        if new_data_type == "DECIMAL":
            print_color(f"Table definition altered successfully , {column_name}({new_precision},{new_scale})",Color.MAGENTA)
        elif new_data_type == "STRING_VAR":
            print_color(f"Table definition altered successfully , {column_name}({size})",Color.MAGENTA)
    except psycopg2.Error as e:
        print(f"Error: {e}")
    finally:
        cursor.close()
        conn.close()

# Example usage:
json_file_path = "generated_jsons/sro_rules.json"
table_info = load_table_info_from_json(json_file_path)

for attribute in table_info["attributes"]:
    column_name = attribute["name"]
    new_data_type = attribute["dataType"]
    size = attribute.get("size", None)
    prec = attribute.get("prec", None)
    new_scale = attribute.get("numberOfDecimalValues", None)
    
    alter_table_column_definition(table_info, column_name, new_data_type, size=size, new_scale=new_scale)
