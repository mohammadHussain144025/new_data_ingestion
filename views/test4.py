import os
import re
import psycopg2
from collections import defaultdict, deque
from concurrent.futures import ThreadPoolExecutor

# Database connection details
host = "172.28.234.94"
db_name = "spriced_meritor"
user = "postgres"
password = "mysecretpassword"
port = 5432

# Directories containing the scripts
view_directory = "view_scripts"
mv_directory = "mv_views"

# Function to parse SQL scripts for dependencies
def parse_dependencies(script):
    # This regex captures potential table/view names following 'FROM' or 'JOIN'
    dependencies = re.findall(r'(?:FROM|JOIN)\s+(\w+)', script, re.IGNORECASE)
    return dependencies

# Function to build a DAG from SQL scripts
def build_dag(directory):
    dag = {}
    for script_file in os.listdir(directory):
        if script_file.endswith("_create_script.sql"):
            file_path = os.path.join(directory, script_file)
            with open(file_path, 'r') as file:
                script = file.read()
                dependencies = parse_dependencies(script)
                view_name = script_file.replace("_create_script.sql", "")
                dag[view_name] = dependencies
    return dag

view_dag = build_dag(view_directory)
mv_dag = build_dag(mv_directory)

# Function for topological sorting of a DAG
def topological_sort(dag):
    indegree = defaultdict(int)
    for key, values in dag.items():
        indegree[key] += 0  # Initialize indegree
        for value in values:
            indegree[value] += 1

    queue = deque([k for k, v in indegree.items() if v == 0])
    sorted_list = []

    while queue:
        node = queue.popleft()
        sorted_list.append(node)
        for neighbor in dag.get(node, []):
            indegree[neighbor] -= 1
            if indegree[neighbor] == 0:
                queue.append(neighbor)
    
    # Check for any nodes that were not included in the sorted list
    if len(sorted_list) != len(dag):
        missing_nodes = set(dag) - set(sorted_list)
        print(f"Warning: Missing nodes in topological sort: {missing_nodes}")

    return sorted_list

sorted_views = topological_sort(view_dag)
sorted_mvs = topological_sort(mv_dag)

# Function to execute a script from a file
def execute_script(cur, conn, file_path):
    with open(file_path, 'r') as file:
        script = file.read()
        try:
            cur.execute(script)
            conn.commit()
            print(f"Successfully executed {file_path}")
        except Exception as e:
            conn.rollback()
            print(f"Error executing {file_path}: {e}")

# Function to process scripts using threading
def process_scripts(directory, sorted_list):
    try:
        conn = psycopg2.connect(
            host=host,
            database=db_name,
            user=user,
            password=password,
            port=port
        )
        cur = conn.cursor()

        with ThreadPoolExecutor() as executor:
            futures = []
            for view_name in sorted_list:
                file_path = os.path.join(directory, view_name + "_create_script.sql")
                if os.path.exists(file_path):
                    futures.append(executor.submit(execute_script, cur, conn, file_path))
                else:
                    print(f"Warning: Script file {file_path} does not exist")

            for future in futures:
                future.result()

        cur.close()
        conn.close()

    except psycopg2.OperationalError as e:
        print(f"OperationalError: {e}")
    except Exception as e:
        print(f"An error occurred: {e}")

# Process view scripts
process_scripts(view_directory, sorted_views)

# Process materialized view scripts
process_scripts(mv_directory, sorted_mvs)
