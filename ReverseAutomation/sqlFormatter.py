def replace_nulls_in_sql_file(input_file, output_file):
    try:
        with open(input_file, 'r') as file:
            file_data = file.read()
        
        # Replace all occurrences of '\N' with 'NULL'
        file_data = file_data.replace('\\N', 'NULL')
        file_data = file_data.replace('\\', '')
        
        with open(output_file, 'w') as file:
            file.write(file_data)
        
        print(f"Successfully replaced '\\N' with 'NULL' in {output_file}")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    input_file = 'part_regional.sql'  # Input file name
    output_file = 'part_regional_.sql'  # Output file name
    
    replace_nulls_in_sql_file(input_file, output_file)
