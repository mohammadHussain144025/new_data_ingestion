import subprocess

def restore_data(host, db_name, user, password, data_file):
    try:
        env = {'PGPASSWORD': password}
        command = f"psql -h {host} -U {user} -d {db_name} -f {data_file}"
        subprocess.run(command, shell=True, check=True, env=env)
        print(f"Data restore from file '{data_file}' successful!")
    except subprocess.CalledProcessError as e:
        print(f"Data restore from file '{data_file}' failed: {e}")

if __name__ == "__main__":
    host = "172.28.234.94"
    db_name = "spriced_meritor"
    user = "postgres"
    password = "mysecretpassword"
    data_file = input("Enter Data File Name to restore: ")
    
    restore_data(host, db_name, user, password, data_file)
