#!/bin/bash

# Define variables
PGPASSWORD="mysecretpassword"
DOCKER_CONTAINER="spriced_postgres"  # Name of the Docker container running PostgreSQL
DB_HOST="localhost"                   # Hostname of the PostgreSQL database
DB_PORT="5432"                        # Port number of the PostgreSQL database
DB_USER="postgres"                    # Username for accessing the PostgreSQL database
DB_NAME="spriced_meritor"                 # Name of the PostgreSQL database
BACKUP_FILE="/mnt/d/Download/backup/backup.pgsql"   # Path to the backup file

# Execute pg_restore command within the PostgreSQL Docker container
docker exec -i spriced_postgres psql -U postgres -d $DB_NAME < $BACKUP_FILE
# Optional: Log the execution for debugging or monitoring purposes
echo "Database restored at $(date)" > /mnt/d/Download/backup/restore_log.log
