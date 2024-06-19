# import subprocess

# def restore_single_table(host, db_name, user, password, backup_file):
#     command = [
#         "psql", "-h", host, "-U", user, "-d", db_name, "-f", backup_file
#     ]
#     try:
#         env = {'PGPASSWORD': password}
#         subprocess.run(command, check=True, env=env)
#         print(f"Restore from file '{backup_file}' successful!.")
#     except subprocess.CalledProcessError as e:
#         print(f"Restore from file '{backup_file}' failed: {e}")

# if __name__ == "__main__":
#     host = "172.28.234.94"
#     db_name = "spriced_meritor"
#     user = "postgres"
#     password = "mysecretpassword"
#     sqlFile = input("Enter Backup File Name to restore: ")
#     backup_file = f"{sqlFile}.sql"
    
#     restore_single_table(host, db_name, user, password, backup_file)


import subprocess

def restore_single_table(host, db_name, user, password, table_name, backup_file):
    truncate_command = f"TRUNCATE TABLE {table_name} RESTART IDENTITY CASCADE;"
    restore_command = [
        "psql", "-h", host, "-U", user, "-d", db_name, "-f", backup_file
    ]
    
    try:
        env = {'PGPASSWORD': password}
        
        # # Truncate the table and restart identity
        # truncate_process = subprocess.run(
        #     ["psql", "-h", host, "-U", user, "-d", db_name, "-c", truncate_command],
        #     check=True, env=env
        # )
        # print(f"Table '{table_name}' truncated successfully.")

        # Restore the table from the backup file
        restore_process = subprocess.run(restore_command, check=True, env=env)
        print(f"Restore from file '{backup_file}' successful!")
    except subprocess.CalledProcessError as e:
        print(f"Restore from file '{backup_file}' failed: {e}")

if __name__ == "__main__":
    host = "172.28.234.94"
    db_name = "spriced_meritor"
    user = "postgres"
    password = "mysecretpassword"
    table_name = input("Enter Table Name to restore: ")
    sql_file = input("Enter Backup File Name to restore: ")
    backup_file = f"{sql_file}.sql"
    
    restore_single_table(host, db_name, user, password, table_name, backup_file)
