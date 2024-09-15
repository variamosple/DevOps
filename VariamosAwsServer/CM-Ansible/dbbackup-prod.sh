#!/bin/bash

source /home/ubuntu/.env.aws.main

# Define backup directory
BACKUP_DIR="/home/ubuntu/backupdb"
DATE=$(date +%F-%H-%M-%S)
DB_PASSWORD="$VARIAMOS_MS_LANGUAGES_DB_PASSWORD"

# Ensure backup directory exists
mkdir -p $BACKUP_DIR

# Leave only the last 10 backup files 

ls -t $BACKUP_DIR | tail -n +11 | xargs -I {} rm -- $BACKUP_DIR/{}

# Perform the backup (e.g., using `docker exec` to run a command inside the container)
docker exec -e PGPASSWORD=$DB_PASSWORD variamos_db_aws_main pg_dumpall -U adminpg > $BACKUP_DIR/db_backup_$DATE.sql
