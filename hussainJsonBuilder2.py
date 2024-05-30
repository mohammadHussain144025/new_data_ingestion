import csv
import json
import requests
import os
import time
import psycopg2

# Function definitions for mapping data types, constraint types, and nullable values
def map_data_type(input_type):
    mapping = {
        'integer': 'INTEGER',   
        'decimal': 'DECIMAL',
        'nvarchar': 'STRING_VAR',
        'bit': 'BOOLEAN',
        'datetime': 'TIME_STAMP',
        'datetime2': 'TIME_STAMP',
        'char': 'STRING_VAR',
        'char ': 'STRING_VAR',
        'numeric': 'INTEGER'
    }
    return mapping.get(input_type.lower(), 'UNKNOWN')

def map_constraint_type(input_type):
    mapping = {
        'PRIMARY_KEY': 'PRIMARY_KEY',
    }
    return mapping.get(input_type, 'NONE')

def map_nullable(input_nullable):
    return input_nullable.lower() == 'yes'

conn = psycopg2.connect(host="localhost", database="spriced", user="postgres", password="mysecretpassword")
cur = conn.cursor()

# Read the sequence of JSON file creation
sequence_data = {}
with open('D:\\codeBase\\Data_Ingestion_Project\\Inputs\\Custom\\sequence_meritor_updated.csv', 'r') as csvfile:
    csvreader = csv.reader(csvfile)
    print(csvreader)
    next(csvreader)  # Skip the header
    for row in csvreader:
        print(row)
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
        'Authorization': 'Bearer eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJDYTZ5YnhvRWhLZ09haHE2U1lWWWxPdFJhSWdRaVYxSFplcmFwOWxBcHNFIn0.eyJleHAiOjE3MTE2MzEyNTUsImlhdCI6MTcxMTYyOTQ1NSwiYXV0aF90aW1lIjoxNzExNjI5NDUzLCJqdGkiOiIxMDdiNDEzZi1hYzI3LTQzOWItYjQyYy0yMDFkYzk2YTkxZGYiLCJpc3MiOiJodHRwczovL2F1dGguZGV2LnNpbWFkdmlzb3J5LmNvbS9hdXRoL3JlYWxtcy9EX1NQUklDRUQiLCJhdWQiOiJhY2NvdW50Iiwic3ViIjoiMDE0ZjI2YzMtMTA2NS00ZGUwLTgxMzMtN2ZmZGJjZWYxZWMyIiwidHlwIjoiQmVhcmVyIiwiYXpwIjoiRF9TUFJJQ0VEX0NsaWVudCIsIm5vbmNlIjoiMjFmYTdiNWItYTVjMy00NDhiLWI0YTQtMzdiNTA4NjExNTM0Iiwic2Vzc2lvbl9zdGF0ZSI6IjQ2ZDZkNWJjLWU1MTctNDk5MS05YTMyLWMxNzUyY2Q0Zjc4MiIsImFjciI6IjAiLCJhbGxvd2VkLW9yaWdpbnMiOlsiaHR0cHM6Ly9zcHJpY2VkLmRldi5zaW1hZHZpc29yeS5jb20iLCJodHRwOi8vbG9jYWxob3N0OjQyMDIiLCJodHRwczovL3NwcmljZWQuZGV2Lm1lcml0b3Iuc2ltYWR2aXNvcnkuY29tIiwiaHR0cHM6Ly9yZXBvcnRzLnNwcmljZWQuZGV2LnNpbWFkdmlzb3J5LmNvbSIsIioiLCJodHRwczovL3d3dy5zaW1hZHZpc29yeS5jb206NDIwMCIsImh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsImh0dHBzOi8vcGRtLnNpbWFkdmlzb3J5LmNvbSIsImh0dHBzOi8vc3ByaWNlZC50ZXN0LnNpbWFkdmlzb3J5LmNvbSJdLCJyZWFsbV9hY2Nlc3MiOnsicm9sZXMiOlsiZGVmYXVsdC1yb2xlcy1kX3NwcmljZWQiLCJBZG1pbiJdfSwicmVzb3VyY2VfYWNjZXNzIjp7ImFjY291bnQiOnsicm9sZXMiOlsibWFuYWdlLWFjY291bnQiLCJtYW5hZ2UtYWNjb3VudC1saW5rcyIsInZpZXctcHJvZmlsZSJdfX0sInNjb3BlIjoib3BlbmlkIHJvbGVzIHByb2ZpbGUgZW1haWwiLCJzaWQiOiI0NmQ2ZDViYy1lNTE3LTQ5OTEtOWEzMi1jMTc1MmNkNGY3ODIiLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsIm5hbWUiOiJNb2hkIEh1c3NhaW4iLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJodXNzYWluIiwiZ2l2ZW5fbmFtZSI6Ik1vaGQiLCJmYW1pbHlfbmFtZSI6Ikh1c3NhaW4iLCJ0ZW5hbnQiOiJtZXJpdG9yIiwiZW1haWwiOiJtb2hkLmh1c2FpbkBzaW1hZHZpc29yeXBhcnRuZXIuY29tIn0.j1w3rJ1vmre5HjP59iQ0nECuKdeiD8jTRiSfhiH4XGYHdJbBtiNQjxqSIvsIPoY2jvMRNjcDzlG3GDrL_OMrh9gdj08sV_F68Q1MnPP5AJuUnLUYajGLMJzoEnmT7kfX55wsT6EG-IJwZkR1GuYBQB0u0gji-9t-7zldOLDhOmXTAll1K2fZzqJi9IDBhy_6Mk_DHun0iVVkB5D__C_xJprHf6_0lxBVhogTDCSdgZgsQpTiJjtZUzatfnPxsQyiTRNBIYz7001As9P1iu7W5oU9iFmtvAJkF_PuG59u_-ClZsqi-v4K9oToxAhT8Hm2XP4xvZHUeo0B9LlIww4ndA',
        'Content-Type': 'application/json',
        # 'tenant': 'meritor',
        # 'user': 'anand.kumar@simadvisory.com',
        # 'transactionId': 'AQWSIDSTWERTXWSATYYOKLMH',
        # 'roles': 'admin,manager,viewer',
        # 'applications': 'app1,app2,app3'
    }
    
    # api_url = 'http://localhost:9001/api/v1/definition/entities'
    api_url = 'https://spriced.dev.meritor.simadvisory.com/api/v1/definition/entities'
    json_file_path = f"D:\\codeBase\\Data_Ingestion_Project\\generated_jsons\\{json_file_name}"  # Assuming the JSON files are in the same directory
    with open(json_file_path, 'r') as f:
        json_data = json.load(f)
    response = requests.post(api_url, headers=headers, json=json_data)
    if response.status_code == 200:
        print(f'Successfully sent {json_file_name} to API.')
    else:
        print(f'Failed to send {json_file_name} to API. Status code: {response.status_code}, Response: {response.text}')

# Read CSV for Mappings
mappings = {}
with open('D:\\codeBase\\Data_Ingestion_Project\\Inputs\\Custom\\related_meritor.csv', 'r') as csvfile:
    csvreader = csv.reader(csvfile)
    next(csvreader)  # Skip the header
    for row in csvreader:
        table_ref_name, column_ref_name, display_name, linked_table_name = row
        mappings[(table_ref_name, column_ref_name)] = linked_table_name

# Read the input JSON
with open('D:\\codeBase\\Data_Ingestion_Project\\Inputs\\Custom\\metadata_meritor.json', 'r') as f:
    tables = json.load(f)
# Process each table and create JSON files

output_tables = {}
allowed_schemas = ["spriced","stg", "mdm"]

# Get autogen tables from jspn metadata
def read_json_for_autogen(json_file_path):
    autogenerated = []
    with open(json_file_path, 'r', encoding='utf-8') as json_file:
        data = json.load(json_file)
        for table_name, columns in data.items():
            for column in columns:
                if column.get('IS_CODE_AUTOGEN', '').strip().lower() == 'true':
                    autogenerated.append(table_name)
                    break
    autogenerated = list(set(autogenerated))
    return autogenerated
output_json_path = 'D:\\codeBase\\Data_Ingestion_Project\\Inputs\\Custom\\metadata_meritor.json'
autogen_tables = read_json_for_autogen(output_json_path)
print("Tables with AUTOGEN set to true:", autogen_tables)

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
        'displayName': 'Updated Date',
        'dataType': 'TIME_STAMP',
        'type': 'FREE_FORM',
        'size': 1,
        'nullable': False,
        'numberOfDecimalValues': 0,
        'constraintType': 'NONE',
        "formatter": "MM/DD/YYYY HH:mm:ss",
        'showInForm': False,
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


# Define the directory where JSON files will be stored
json_dir = 'D:\\codeBase\\Data_Ingestion_Project\\generated_jsons'
# Ensure the directory exists, if not, create it
if not os.path.exists(json_dir):
    os.makedirs(json_dir)

print(sorted_sequence)
# Iterate through all the tables
for sequence_number, json_name in sorted_sequence:
    table_val = json_name
    table_data={}
    print("Sequence No",sequence_number,json_name)
    
    for table, columns in tables.items():
        if table_val == table:

            # print("The table is    ",table)
            #print("Table",table,"Table_val",table_val) if table_val == table.lower().replace(" ", "_") else print("No Match detected")
            # if table_val!=table.lower().replace(" ", "_"):
            #     continue
            process_table = True
            tdn = ''
            for column in columns:
                if 'Table_Display_Name' in column:
                    tdn = column['Table_Display_Name']
                    break
            # print("***********tdn**********", tdn)
            temp_data = {
                'name': table.lower().replace(" ", "_"),
                'displayName': str(tdn),
                'groupId': 1,
                'isDisabled': False,
                'enableAuditTrial': True,
                'comment': "Newly created",
                'attributes': [],
                'autoNumberCode': False,
                'updatedDate': '2023-10-01T15:37:39.574+00:00',
                'updatedBy': 'anand.kumar@simadvisory.com',
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
           # print("The table data is", table_data)
            table_data['attributes'].append(id_field)

            for column in columns:
                # Check if the column belongs to an allowed schema
                if column.get("TABLE_SCHEMA", "").lower() in allowed_schemas:
                    # Determine the type of the column
                    column_type = "FREE_FORM"
                    # print(column)
                    # If it's a reference column, search for it in mappings
                    if column['IS_REF_COLUMN'] == 'TRUE':
                        search_string = column['COLUMN_NAME'].lower().replace(" ", "_")
                        for (table_ref_name, column_ref_name), linked_table_name in mappings.items():
                            if column_ref_name == search_string:
                                column_type = "LOOKUP"
                                break
                    
                    # Initialize the new column dictionary
                    def_data_type = "INTEGER" if column_type == "LOOKUP" else map_data_type(column['DATA_TYPE'].lower())
                    size_data_type = 0 if def_data_type in ("INTEGER","TIME_STAMP","BOOLEAN") else column['SIZE']
                    
                    # Define display name of the column
                    display_name = column.get('DISPLAY_NAME', column['COLUMN_NAME'])
                    display_name = display_name.replace("_", " ") if not column['COLUMN_NAME'].endswith('_Code') else column['DISPLAY_NAME'][:-5].replace("_", " ")
                    
                    new_column = {
                        'name': column['COLUMN_NAME'][:-5].lower().replace(" ", "_") if column['COLUMN_NAME'].endswith('_Code') else column['COLUMN_NAME'].lower().replace(" ", "_"),
                        'displayName': display_name,
                        'dataType': def_data_type,
                        'type': "LOOKUP" if column['IS_REF_COLUMN'] == True else column_type,
                        'size': column['SIZE'],
                        'nullable': map_nullable(column['IS_NULLABLE']),
                        # 'numberOfDecimalValues': column['POS'] if def_data_type =='DECIMAL' else 0,
                        'numberOfDecimalValues': column['POS'] if def_data_type in ('DECIMAL', 'NUMERIC', 'INTEGER') else 0,
                        'constraintType': "UNIQUE_KEY" if column['COLUMN_NAME'].lower() == 'code' else "FOREIGN_KEY" if column_type =="LOOKUP" else "NONE",
                        'showInForm': True,
                        'permission': 'UPDATE',
                        'indexed': True,
                        'onlyDisplayNameEditable': False,
                        'editable': True,
                        'autoGenerated': True if column['COLUMN_NAME'].lower().replace(" ", "_") == 'code' else False,
                        'systemAttribute': False
                    }
                    
                    if table_val in autogen_tables and new_column['name'] == 'code':
                        new_column['dataType'] = 'AUTO'

                    if def_data_type in ("TIME_STAMP","INTEGER"):
                        new_column['formatter'] =  "MM/DD/YYYY" if def_data_type == "TIME_STAMP" else "-####"
                    
                    if column_type == "LOOKUP":
                        # Get the linked table name from the mappings dictionary
                        key = (table.lower().replace(" ", "_"), column['COLUMN_NAME'].lower().replace(" ", "_"))
                        linked_table_name = mappings.get(key, None).lower().replace(" ","_")
                        if linked_table_name is not None:
                            # Query for Entity ID
                            print(linked_table_name)
                            query = f"SELECT id FROM entity WHERE name = '{linked_table_name}'"
                            cur.execute(query)
                            entity_id = cur.fetchone()[0] if cur.rowcount > 0 else None
                            if entity_id is not None:
                                # Append Entity Name
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
            # with open(f"{table_val}.json", 'w') as f:
            #     if table_data["name"] == table_val:
            #         json.dump(table_data, f, indent=4)

            # Write the JSON file to the specified directory
            with open(os.path.join(json_dir, f"{table_val}.json"), 'w') as f:
                if table_data["name"] == table_val:
                    json.dump(table_data, f, indent=4)

            # if (table_val =="segment"):
            #     #call_api_for_json(f"{table_val}.json")
            #     break
            # call_api_for_json(f"{table_val}.json")
            time.sleep(0.1)
            # #print(table)  # Replaced 'table_name' with 'table'
# cur.close()
# conn.close()