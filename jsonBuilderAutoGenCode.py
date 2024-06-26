import csv
import psycopg2
import json
import requests
import os
import time

# Function definitions for mapping data types, constraint types, and nullable values
def map_data_type(input_type):
    mapping = {
        'integer': 'INTEGER',
        'decimal': 'INTEGER',
        'nvarchar': 'STRING_VAR',
        'bit': 'BOOLEAN',
        'datetime': 'TIME_STAMP',
        'datetime2': 'TIME_STAMP',
    }
    return mapping.get(input_type.lower(), 'UNKNOWN')

def map_constraint_type(input_type):
    mapping = {
        'PRIMARY_KEY': 'PRIMARY_KEY',
    }
    return mapping.get(input_type, 'NONE')

def map_nullable(input_nullable):
    return input_nullable.lower() == 'yes'

# Open the database connection
conn = psycopg2.connect(host="localhost", database="spriced_nrp", user="postgres", password="mysecretpassword")
cur = conn.cursor()

# Read the sequence of JSON file creation
sequence_data = {}
with open('/mnt/c/Users/anand.kumar_simadvis/Desktop/common_folder/Ingestion Script/inputs/sequence.csv', 'r') as csvfile:
    csvreader = csv.reader(csvfile)
    next(csvreader)  # Skip the header
    for row in csvreader:
        json_name, sequence_number = row
        sequence_data[int(sequence_number)] = json_name
# Sort the sequence data based on sequence number
sorted_sequence = sorted(sequence_data.items(), key=lambda x: x[0])

print(sorted_sequence)
# Define a flag to indicate if the table should be processed
process_table = False

# Define API call function
def call_api_for_json(json_file_name):
    headers = {
        'Authorization': 'Bearer ',
        'Content-Type': 'application/json',
        'tenant': 'meritor',
        'user': 'anand.kumar@simadvisory.com',
        'transactionId': 'AQWSIDSTWERTXWSATYYOKLMH',
        'roles': 'admin,manager,viewer',
        'applications': 'app1,app2,app3'
    }
    api_url = 'http://localhost:8080/api/v1/definition/entities'
    json_file_path = f"/mnt/c/Users/anand.kumar_simadvis/Desktop/common_folder/Ingestion Script/{json_file_name}"  # Assuming the JSON files are in the same directory
    with open(json_file_path, 'r') as f:
        json_data = json.load(f)
    response = requests.post(api_url, headers=headers, json=json_data)
    if response.status_code == 200:
        print(f'Successfully sent {json_file_name} to API.')
    else:
        print(f'Failed to send {json_file_name} to API. Status code: {response.status_code}, Response: {response.text}')

# Read CSV for Mappings
mappings = {}
with open('/mnt/c/Users/anand.kumar_simadvis/Desktop/common_folder/Ingestion Script/inputs/related_csv.csv', 'r') as csvfile:
    csvreader = csv.reader(csvfile)
    next(csvreader)  # Skip the header
    for row in csvreader:
        table_ref_name, column_ref_name, linked_table_name = row
        mappings[(table_ref_name, column_ref_name)] = linked_table_name

# Read the input JSON
with open('/mnt/c/Users/anand.kumar_simadvis/Desktop/common_folder/Ingestion Script/inputs/metadata_new_16_Nov.json', 'r') as f:
    tables = json.load(f)
# Process each table and create JSON files

output_tables = {}
allowed_schemas = ["stg", "mdm"]

# Get the list of tables with code as autogenerated
autogenerated = []
with open('/mnt/c/Users/anand.kumar_simadvis/Desktop/common_folder/Ingestion Script/inputs/autogenerated_list.csv', 'r') as csvfile:
    csvreader = csv.reader(csvfile)
    for row in csvreader:
        autogenerated.append(row[0])

# Define the hardcoded fields outside the loop
hardcoded_fields = [
    {
        'name': 'updated_by',
        'displayName': 'Updated By',
        'dataType': 'STRING_VAR',
        'type': 'FREE_FORM',
        'size': 250,
        'nullable': False,
        'numberOfDecimalValues': 0,
        'constraintType': 'NONE',
        'showInForm': False,
        'editable': False,
        'autoGenerated': False,
        'systemAttribute': True
    },
    {
        'name': 'updated_date',
        'displayName': 'Last Updated On',
        'dataType': 'TIME_STAMP',
        'type': 'FREE_FORM',
        'size': 1,
        'nullable': False,
        'numberOfDecimalValues': 0,
        'constraintType': 'NONE',
        "formatter": "MM/DD/YYYY HH:mm:ss",
        'showInForm': True,
        'editable': False,
        'autoGenerated': False,
        'systemAttribute': True
    },
    {
        'name': 'validationstatus',
        'displayName': 'Validation Status',
        'dataType': 'STRING_VAR',
        'type': 'FREE_FORM',
        'size': 250,
        'nullable': True,
        'numberOfDecimalValues': 0,
        'constraintType': 'NONE',
        'showInForm': False,
        'editable': False,
        'autoGenerated': False,
        'systemAttribute': True
    },
    {
        'name': 'is_valid',
        'displayName': 'Is Valid',
        'dataType': 'BOOLEAN',
        'type': 'FREE_FORM',
        'size': 1,
        'nullable': False,
        'numberOfDecimalValues': 0,
        'constraintType': 'NONE',
        'showInForm': False,
        'editable': False,
        'autoGenerated': False,
        'systemAttribute': True
    }
]


# Iterate through all the tables

for sequence_number, json_name in sorted_sequence:
    table_val = json_name
    table_data={}
    #print("Sequence No",sequence_number,json_name)
    for table, columns in tables.items():
        #print("Table",table,"Table_val",table_val) if table_val == table.lower().replace(" ", "_") else print("No Match detected")
        if table_val!=table.lower().replace(" ", "_"):
            continue
        process_table = True
        
        temp_data = {
            'name': table.lower().replace(" ", "_"),
            'displayName': table,
            'groupId': 1,
            'isDisabled': False,
            'enableAuditTrial': True,
            'comment': "Newly created",
            'attributes': [],
            'autoNumberCode': False,
            'updatedDate': '2023-10-01T15:37:39.574+00:00',
            'updatedBy': 'anand.kumar@simadvisory.com'
        }
        # Add the 'id' field
        id_field = {
            'name': 'id',
            'displayName': 'id',
            'dataType': 'AUTO',
            'type': 'FREE_FORM',
            'nullable': False,
            'numberOfDecimalValues': 0,
            'constraintType': 'PRIMARY_KEY',
            'showInForm': True,
            'editable': False,
            'autoGenerated': False,
            'systemAttribute': True
            }
        table_data=temp_data
        table_data['attributes'].append(id_field)

        for column in columns:
        #print(column)
            if column.get("TABLE_SCHEMA", "").lower() in allowed_schemas:
                # Determine the type of the column
                column_type = "FREE_FORM"
                #print("Table",table)
                if column['IS_REF_COLUMN']== True:
                    search_string = column['COLUMN_NAME']  # Replace with the string you want to search for
                    search_string = search_string.lower().replace(" ","_")
                    # Iterate through the mappings dictionary and check for the search string in the column_ref_name
                    for (table_ref_name, column_ref_name), linked_table_name in mappings.items():
                        if column_ref_name == search_string:
                            #print(f"Found match: Table Ref Name: {table_ref_name}, Column Ref Name: {column_ref_name}, Linked Table Name: {linked_table_name}")
                            column_type = "LOOKUP"
                            break
                # Initialize the new column dictionary
                def_data_type = "INTEGER" if column_type == "LOOKUP" else map_data_type(column['DATA_TYPE'])
                size_data_type = 0 if def_data_type in ("INTEGER","TIME_STAMP","BOOLEAN") else column['SIZE']
                #size_data_type = 0 if def_data_type == "TIME_STAMP" else 500
                new_column = {
                    'name': column['COLUMN_NAME'][:-5].lower().replace(" ", "_") if column['COLUMN_NAME'].endswith('_Code') else column['COLUMN_NAME'].lower().replace(" ", "_"),
                    'displayName': column['COLUMN_NAME'].replace("_", " ") if not column['COLUMN_NAME'].endswith('_Code')
                        else column['COLUMN_NAME'][:-5].replace("_", " "),
                    'dataType' : "INTEGER" if column['POS'] == '0' else ("DECIMAL" if (column['POS'] != None and column['POS'] != '0') else def_data_type),
                    'type': "LOOKUP" if column['IS_REF_COLUMN'] == True else column_type,
                    'size': size_data_type if def_data_type!= "INTEGER" else column['POS'],
                    'nullable': map_nullable(column['IS_NULLABLE']),
                    'numberOfDecimalValues': column['POS'] if def_data_type =='INTEGER' else 0,
                    'constraintType': "UNIQUE_KEY" if column['COLUMN_NAME'].lower() == 'code'
                        else "FOREIGN_KEY" if column_type =="LOOKUP" else "NONE",
                    'showInForm': True,
                    'permission': 'UPDATE',
                    'indexed': True,
                    'onlyDisplayNameEditable': False,
                    'editable': True,
                    'autoGenerated': False,
                    'systemAttribute': False
                }
                if table_val in autogenerated and new_column['name'] == 'code':
                    new_column['dataType'] = 'AUTO'

                if def_data_type in ("TIME_STAMP","INTEGER"):
                    new_column['formatter'] =  "MM/DD/YYYY" if def_data_type == "TIME_STAMP" else "-####"

                if column_type == "LOOKUP":
                    # Get the linked table name from the mappings dictionary
                    key = (table.lower().replace(" ", "_"), column['COLUMN_NAME'].lower().replace(" ", "_"))
                    print("Key:", key)
                    linked_table_name = mappings.get(key, None).lower().replace(" ","_")
                    #print("Key:", key,"Linked Table Name",linked_table_name)
                    if linked_table_name is not None:
                        # Step 4: Query for Entity ID
                        query = f"SELECT id FROM entity WHERE name = '{linked_table_name}'"
                        cur.execute(query)
                        entity_id = cur.fetchone()[0] if cur.rowcount > 0 else None
                        print("Running for Table",table_val,"Entity Id found for lookup ",entity_id,"Linked Table Name",linked_table_name,"for Column",column['COLUMN_NAME'].lower().replace(" ","_"))
                        if entity_id is not None:
                            # Step 5: Append Entity Name
                            new_column['referencedTable'] = linked_table_name
                            new_column['referencedTableId'] = entity_id
                            new_column['referencedTableDisplayName'] = linked_table_name

                table_data['attributes'].append(new_column)

            # Append the hardcoded fields to the attributes list
        table_data['attributes'].extend(hardcoded_fields)
    index = table.lower().replace(" ", "_")
    #print("Index:", index)
    print(table_val)
    output_tables[index] = table_data
    #print(table_data)
    with open(f"{table_val}.json", 'w') as f:
        json.dump(table_data, f, indent=4)
    
    #if (table_val =="segment" or table_val=="local_segment"):
    #if (table_val =="segment"):
        #call_api_for_json(f"{table_val}.json")
        #break
    call_api_for_json(f"{table_val}.json")
    time.sleep(0.1)
    #print(table)  # Replaced 'table_name' with 'table'
cur.close()
conn.close()