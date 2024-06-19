# import subprocess

# def backup_data(host, port, db_name, user, password, backup_file, pg_dump_path):
#     command = (
#         f"{pg_dump_path} -h {host} -p {port} -U {user} -d {db_name} --data-only -f {backup_file}"
#     )
#     try:
#         env = {'PGPASSWORD': password}
#         subprocess.run(command, shell=True, check=True, env=env)
#         print(f"Backup successful: {backup_file}")
#     except subprocess.CalledProcessError as e:
#         print(f"Backup failed: {e}")

# if __name__ == "__main__":
#     source_host = "127.0.0.1"
#     source_port = "5434"
#     source_db = "spriced_meritor"
#     username = "postgres"
#     password = "mysecretpassword"
#     backup_file_path = "data_backup.sql"
#     pg_dump_path = "/usr/bin/pg_dump"  # Update this path if needed
    
#     backup_data(source_host, source_port, source_db, username, password, backup_file_path, pg_dump_path)

import subprocess
import os
import sys
import select

def backup_data(host, port, db_name, user, password, backup_file, pg_dump_path):
    command = [
        pg_dump_path, "-h", host, "-p", str(port), "-U", user, "-d", db_name, "--data-only", "-f", backup_file
    ]
    try:
        env = os.environ.copy()
        env['PGPASSWORD'] = password
        process = subprocess.Popen(command, env=env, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        
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
            print(f"Backup successful: {backup_file}")
        else:
            print(f"Backup failed with return code {process.returncode}")

    except Exception as e:
        print(f"Backup failed: {e}")

if __name__ == "__main__":
    source_host = "127.0.0.1"
    source_port = 5434
    source_db = "spriced_meritor"
    username = "postgres"
    password = "mysecretpassword"
    backup_file_path = "data_backup.sql"
    pg_dump_path = "/usr/bin/pg_dump"  # Update this path if needed
    
    backup_data(source_host, source_port, source_db, username, password, backup_file_path, pg_dump_path)
