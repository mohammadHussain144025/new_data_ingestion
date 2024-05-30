import os
import pandas as pd

def convert_csv_column_headers(directory):
    # List all files in the directory
    files = os.listdir(directory)

    # Filter out only CSV files
    csv_files = [file for file in files if file.lower().endswith('.csv')]
    
    if not csv_files:
        print("No CSV files found in the directory:", directory)
        return

    # Iterate through each CSV file
    for file in csv_files:
        file_path = os.path.join(directory, file)
        print("Processing file:", file_path)

        try:
            # Read CSV file into DataFrame with 'latin1' encoding
            df = pd.read_csv(file_path, encoding='latin1')

            # Convert column headers to lowercase and trim spaces
            df.columns = df.columns.str.lower().str.strip()

            # Write back to CSV
            df.to_csv(file_path, index=False)

            print("Conversion done for:", file_path)
        except Exception as e:
            print(f"Error processing file {file_path}: {e}")

# Provide the directory path where your CSV files are located
directory_path = 'D:\\newCsv'

# Call the function to convert column headers
convert_csv_column_headers(directory_path)
