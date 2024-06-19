import subprocess

def restore_single_table(host, db_name, user, password, table_name, backup_file):
    drop_command = f"DROP TABLE IF EXISTS {table_name} CASCADE;"
    restore_command = [
        "psql", "-h", host, "-U", user, "-d", db_name, "-f", backup_file
    ]
    create_view_command = f"CREATE VIEW view_{table_name} AS SELECT * FROM {table_name};"

    try:
        env = {'PGPASSWORD': password}
        
        # Drop the table if it exists
        drop_process = subprocess.run(
            ["psql", "-h", host, "-U", user, "-d", db_name, "-c", drop_command],
            check=True, env=env
        )
        print(f"Table '{table_name}' dropped successfully.")

        # Restore the table from the backup file
        restore_process = subprocess.run(restore_command, check=True, env=env)

        # Create the view
        create_view_process = subprocess.run(
            ["psql", "-h", host, "-U", user, "-d", db_name, "-c", create_view_command],
            check=True, env=env
        )
        print(f"View 'view_{table_name}' created successfully.")

        print(f"Restore from file '{backup_file}' successful!.")
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
