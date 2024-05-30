import csv

def find_missing_values(csv_file):
    with open(csv_file, 'r') as file:
        rows = file.readlines()

        first_column_values = set(rows[0].strip().split())
        second_column_values = set(rows[1].strip().split())

        missing_in_first_column = second_column_values - first_column_values
        missing_in_second_column = first_column_values - second_column_values

        return missing_in_first_column, missing_in_second_column

if __name__ == "__main__":
    csv_file = "Inputs\\missingValues.csv"  # Replace "Inputs\\missingValues.csv" with the path to your CSV file
    missing_in_first_column, missing_in_second_column = find_missing_values(csv_file)

    # print("Values missing in the first column:")
    print("\nExtra column from client:")
    for value in sorted(missing_in_first_column):
        print(value)

    # print("\nValues missing in the second column:")
    print("\nColumn missing in the client data:")
    for value in sorted(missing_in_second_column):
        print(value)
