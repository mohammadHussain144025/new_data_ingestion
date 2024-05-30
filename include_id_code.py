import csv

def convert_headers_to_lowercase(input_csv_file, output_csv_file):
    with open(input_csv_file, 'r', newline='', encoding='utf-8-sig', errors='ignore') as csvfile:
        reader = csv.DictReader(csvfile)
        input_fieldnames = reader.fieldnames

        # Convert column headers to lowercase
        headers = [header.lower() for header in input_fieldnames]
        headers.extend(['id', 'name', 'code'])  # Add 'name' field along with 'id' and 'code'

        with open(output_csv_file, 'w', newline='', encoding='utf-8') as outfile:
            writer = csv.DictWriter(outfile, fieldnames=headers)
            writer.writeheader()

            # set the id and code ,{ select max(id) from customer_part_numbers + 1 }
            id_counter = 1
            code_counter = 1

            for row in reader:
                # Prepare the row with "id" and "code" values
                row["id"] = id_counter
                row["code"] = code_counter
                id_counter += 1
                code_counter += 1

                # Write the row to the output CSV file
                writer.writerow({key.lower(): value for key, value in row.items()})

# Example usage:
input_file = 'D:\\Download\\18_05_24\\CSV\\EXTRACTED\\coninv.csv'   # Replace 'input.csv' with your input CSV file
output_file = 'D:\\Download\\coninv.csv'  # Replace 'output.csv' with the desired output CSV file path

convert_headers_to_lowercase(input_file, output_file)
