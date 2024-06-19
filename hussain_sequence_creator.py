import os
import csv

directory = 'D:\\newCsv\\data_12_03_24\\completed'  # Directory containing CSV files
output_file = 'D:\\codeBase\\Data_Ingestion_Project\\Inputs\\sequence_meritor.csv'

# List all CSV files in the directory
csv_files = [file for file in os.listdir(directory) if file.endswith('.csv')]

# Prepare the data to be written into CSV
data = [['json_name', 'Sequence of Ingestion']]

# Iterate through each CSV file and add its name along with sequence
for idx, csv_file in enumerate(csv_files, start=1):
    # Remove the extension from the filename
    file_name = os.path.splitext(csv_file)[0]
    try:
        with open(os.path.join(directory, csv_file), 'r', newline='', encoding='utf-8') as file:
            # Check if the file is empty
            if os.stat(os.path.join(directory, csv_file)).st_size == 0:
                print(f"Skipping empty file: {csv_file}")
                continue
            # Check encoding and permissions
            data.append([file_name, idx])
    except Exception as e:
        print(f"Error processing file '{csv_file}': {e}")

# Write data to CSV file
with open(output_file, 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerows(data)

print(f"CSV file '{output_file}' has been created successfully.")
