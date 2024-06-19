import csv
import os

def remove_whitespace_from_blank_cells(input_file, output_file):
    temp_file = output_file + '.tmp'
    
    with open(input_file, 'r', newline='') as infile, \
            open(temp_file, 'w', newline='') as outfile:
        reader = csv.reader(infile)
        writer = csv.writer(outfile)

        for row in reader:
            cleaned_row = [cell.strip() if cell.strip() == "" else cell for cell in row]
            writer.writerow(cleaned_row)

    # Replace the original file with the temporary file
    os.replace(temp_file, output_file)

input_file = 'C:\\Users\\mohd.husain_simadvis\\Desktop\\Reference Data\\customerNew.csv'
output_file = 'C:\\Users\\mohd.husain_simadvis\\Desktop\\Reference Data\\customerNew_cleaned.csv'
remove_whitespace_from_blank_cells(input_file, output_file)
