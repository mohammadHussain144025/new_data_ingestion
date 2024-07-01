#!/bin/bash

# Set variables for database connection
PGUSER='postgres'
PGDATABASE='spriced_meritor'

# Set the path where you want to store the backup files
BACKUP_DIR=/home/ubuntu/db_backups

# Get current date and time
datestamp=$(date +'%Y-%m-%d')
timestamp=$(date +'%H%M')

ls -1t $BACKUP_DIR/${PGDATABASE}_Meritor_UAT_*.pgsql.gz | tail -n +5 | xargs rm -f

PGPASSWORD="mysecretpassword" docker exec spriced_postgres pg_dump -U postgres -h localhost spriced_meritor | gzip > "$BACKUP_DIR/$PGDATABASE"_UAT_"$datestamp"_"$timestamp".pgsql.gz


