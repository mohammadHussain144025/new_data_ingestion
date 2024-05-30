import csv
import json

def csv_to_json(csv_file_path, json_file_path):
    # Read CSV file and convert it to a list of dictionaries
    with open(csv_file_path, mode='r', encoding='utf-8') as csv_file:
        # Specify ',' as the delimiter
        csv_reader = csv.reader(csv_file, delimiter=',')
        header = next(csv_reader)  # Get the header
        data = [dict(zip(header, row)) for row in csv_reader]

    # Identify the key column names dynamically from the header
    key_columns = [col for col in header if col]
    print("All Columns:", key_columns)  # Add this line for debugging

    # Process the data and create a dictionary for each table
    table_data = {}
    for row in data:
        table_name = row.get(key_columns[0], '') if key_columns else ''
        if table_name:
            if table_name not in table_data:
                table_data[table_name] = []
            table_schema = row.get('TABLE_SCHEMA', '')
            column_name = row.get('COLUMN_NAME', '')
            data_type = row.get('DATA_TYPE', '')
            size = int(row['SIZE']) if row.get('SIZE', '').isdigit() else None
            is_nullable = row.get('IS_NULLABLE', '')
            display_name = row.get('DISPLAY_NAME') or 'Unnamed Column'  # Default value if DISPLAY_NAME is blank
            is_ref_col = row.get('IS_REF_COLUMN')
            pos = row.get('POS')
            primary_key = row.get('PRIMARY_KEY')
            table_display_name = row.get('Table_Display_Name')
            isCodeAutoGen = row.get('AUTOGEN')
            entry = {
                'TABLE_SCHEMA': table_schema,
                'COLUMN_NAME': column_name,
                'DATA_TYPE': data_type,
                'SIZE': size,
                'IS_NULLABLE': is_nullable,
                'DISPLAY_NAME': display_name,
                'IS_REF_COLUMN': is_ref_col ,
                'POS': pos ,
                'PRIMARY_KEY': primary_key,
                'Table_Display_Name': table_display_name,
                'IS_CODE_AUTOGEN': isCodeAutoGen
            }
            table_data[table_name].append(entry)

    # Write the JSON file
    with open(json_file_path, 'w', encoding='utf-8') as json_file:
        json.dump(table_data, json_file, indent=3, ensure_ascii=False)


# Example usage
input_csv_path = 'D:\\codeBase\\Data_Ingestion_Project\\Inputs\\Raw\\source_data\\SourceData.csv'
# input_csv_path ='new_dataSource_generated.csv'
output_json_path = 'D:\\codeBase\\Data_Ingestion_Project\\Inputs\Custom\\metadata_meritor.json'
csv_to_json(input_csv_path, output_json_path)
