import pandas as pd

# Load the CSV file
file_path = 'part_regional.csv'  # Replace with your file path
df = pd.read_csv(file_path)

# Display the first few rows to understand the data
print("Original 'sup_dt' column:")
print(df['sup_dt'].head())

# Strip any leading/trailing spaces in the column names
df.columns = df.columns.str.strip()

# Convert the 'sup_dt' column to datetime and format it to 'YYYY-MM-DD'
df['sup_dt'] = pd.to_datetime(df['sup_dt'], errors='coerce').dt.strftime('%Y-%m-%d')

# Display the first few rows after conversion
print("\nConverted 'sup_dt' column:")
print(df['sup_dt'].head())

# Save the modified DataFrame back to a CSV file
output_file_path = 'part_regional1.csv'  # Replace with your desired output file path
df.to_csv(output_file_path, index=False)

print(f"\nConverted CSV saved to {output_file_path}")
