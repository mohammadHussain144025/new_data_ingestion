# import subprocess

# def restore_data(host, db_name, user, password, backup_file):
#     command = f"psql -h {host} -U {user} -d {db_name} -f {backup_file}"
#     try:
#         env = {'PGPASSWORD': password}
#         subprocess.run(command, shell=True, check=True, env=env)
#         print(f"Restore successful to database: {db_name}")
#     except subprocess.CalledProcessError as e:
#         print(f"Restore failed: {e}")

# if __name__ == "__main__":
#     target_host = "172.28.234.94"
#     target_db = "spriced_meritor"
#     username = "postgres"
#     password = "mysecretpassword"
#     backup_file_path = "data_backup.sql"
    
#     restore_data(target_host, target_db, username, password, backup_file_path)
import subprocess
import os
import sys
import select

def restore_data(host, db_name, user, password, backup_file, psql_path):
    disable_triggers = (
        "DO $$ DECLARE r record; BEGIN "
        "FOR r IN (SELECT tablename FROM pg_tables WHERE schemaname = 'public') LOOP "
        "EXECUTE 'ALTER TABLE ' || quote_ident(r.tablename) || ' DISABLE TRIGGER ALL'; "
        "END LOOP; END $$; "
        "SET session_replication_role = replica;"
    )
    enable_triggers = "SET session_replication_role = DEFAULT;"
    try:
        env = os.environ.copy()
        env['PGPASSWORD'] = password

        # Disable triggers
        disable_command = [psql_path, "-h", host, "-U", user, "-d", db_name, "-c", disable_triggers]
        subprocess.run(disable_command, env=env, check=True)
        
        # Restore data
        restore_command = [psql_path, "-h", host, "-U", user, "-d", db_name, "-f", backup_file]
        process = subprocess.Popen(restore_command, env=env, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        
        while True:
            reads = [process.stdout.fileno(), process.stderr.fileno()]
            ret = select.select(reads, [], [])
            
            for fd in ret[0]:
                if fd == process.stdout.fileno():
                    read = process.stdout.readline()
                    if read:
                        print(read.strip())
                if fd == process.stderr.fileno():
                    read = process.stderr.readline()
                    if read:
                        print(read.strip(), file=sys.stderr)
            
            if process.poll() is not None:
                break
        
        if process.returncode == 0:
            print(f"Restore successful to database: {db_name}")
        else:
            print(f"Restore failed with return code {process.returncode}")

        # Enable triggers
        enable_command = [psql_path, "-h", host, "-U", user, "-d", db_name, "-c", enable_triggers]
        subprocess.run(enable_command, env=env, check=True)

    except Exception as e:
        print(f"Restore failed: {e}")

if __name__ == "__main__":
    target_host = "172.28.234.94"
    target_db = "spriced_meritor"
    username = "postgres"
    password = "mysecretpassword"
    backup_file_path = "data_backup.sql"
    psql_path = "/usr/bin/psql"  # Update this path with the actual path from 'which psql'
    
    restore_data(target_host, target_db, username, password, backup_file_path, psql_path)
