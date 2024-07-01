import pandas as pd
import json

# Load the JSON file with column names
json_file_path = 'dateConfig.json'  # Replace with your JSON file path
with open(json_file_path, 'r') as f:
    date_columns_info = json.load(f)

date_columns = date_columns_info.get('date_columns', [])

# Load the CSV file
csv_file_path = 'part_regional.csv'  # Replace with your CSV file path
df = pd.read_csv(csv_file_path)

# Strip any leading/trailing spaces in the column names
df.columns = df.columns.str.strip()

# Convert the listed date columns to 'YYYY-MM-DD' format
for col in date_columns:
    if col in df.columns:
        print(f"Converting column: {col}")
        df[col] = pd.to_datetime(df[col], errors='coerce').dt.strftime('%Y-%m-%d')

# Display the first few rows after conversion to verify
print("\nConverted DataFrame:")
print(df.head())

# Save the modified DataFrame back to a CSV file
output_file_path = 'part_regional1.csv'  # Replace with your desired output file path
df.to_csv(output_file_path, index=False)

print(f"\nConverted CSV saved to {output_file_path}")
