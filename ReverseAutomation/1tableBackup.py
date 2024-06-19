import subprocess

def backup_single_table(host, port, db_name, user, password, table_name, backup_file):
    command = [
        "pg_dump", "-h", host, "-p", str(port), "-U", user, "-d", db_name, "-t", table_name, "-f", backup_file
    ]
    try:
        env = {'PGPASSWORD': password}
        subprocess.run(command, check=True, env=env)
        print(f"Backup of table '{table_name}' successful. Backup file saved as '{backup_file}'.")
    except subprocess.CalledProcessError as e:
        print(f"Backup of table '{table_name}' failed: {e}")

if __name__ == "__main__":
    host = "127.0.0.1"
    port = 5434
    db_name = "spriced_meritor"
    user = "postgres"
    password = "mysecretpassword"
    table_name = input(f"Enter Table Name : ")
    # table_name = "technical_part_details"
    backup_file = f"{table_name}.sql"
    
    backup_single_table(host, port, db_name, user, password, table_name, backup_file)
