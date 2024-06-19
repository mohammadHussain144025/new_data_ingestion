import pandas as pd

# Load the CSV files
aca = pd.read_csv('aca.csv')
oca = pd.read_csv('oca.csv')

# Merge the CSV files based on 'part_num'
merged_df = pd.merge(aca, oca, on='part_num', how='outer')

# Save the merged dataframe to a new CSV file
merged_df.to_csv('merged_aca_oca.csv', index=False)

print("Merged CSV files successfully and saved as 'merged_aca_oca.csv'")
