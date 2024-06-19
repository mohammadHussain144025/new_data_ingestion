import subprocess

def backup_single_table(host, port, db_name, user, password, table_name, schema_backup, data_backup):
    if schema_backup.lower() == 'y':
        schema_backup_file = f"{table_name}_schema.sql"
        schema_command = [
            "pg_dump", "-h", host, "-p", str(port), "-U", user, "-d", db_name, "-t", table_name, "--schema-only", "-f", schema_backup_file
        ]
        try:
            env = {'PGPASSWORD': password}
            subprocess.run(schema_command, check=True, env=env)
            print(f"Schema backup of table '{table_name}' successful. Backup file saved as '{schema_backup_file}'.")
        except subprocess.CalledProcessError as e:
            print(f"Schema backup of table '{table_name}' failed: {e}")

    if data_backup.lower() == 'y':
        data_backup_file = f"{table_name}_data.sql"
        data_command = [
            "pg_dump", "-h", host, "-p", str(port), "-U", user, "-d", db_name, "-t", table_name, "--data-only", "-f", data_backup_file
        ]
        try:
            env = {'PGPASSWORD': password}
            subprocess.run(data_command, check=True, env=env)
            print(f"Data backup of table '{table_name}' successful. Backup file saved as '{data_backup_file}'.")
        except subprocess.CalledProcessError as e:
            print(f"Data backup of table '{table_name}' failed: {e}")

if __name__ == "__main__":
    host = "127.0.0.1"
    port = 5434
    db_name = "spriced_meritor"
    user = "postgres"
    password = "mysecretpassword"
    table_name = input("Enter Table Name: ")
    schema_backup = input("Do you want to take schema backup (Y/N)? ")
    data_backup = input("Do you want to take data backup (Y/N)? ")
    
    backup_single_table(host, port, db_name, user, password, table_name, schema_backup, data_backup)
