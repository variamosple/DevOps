#!/bin/bash

# Load environment variables from the .env file
source /home/oaguayo/.ceis.env

# Define the backup file path
BACKUP_FILE="/home/oaguayo/db_backup_2024-10-19-02-00-01.sql"
DB_PASSWORD="$VARIAMOS_MS_LANGUAGES_DB_PASSWORD"
DB_USER="$VARIAMOS_MS_LANGUAGES_DB_USER"
DB_HOST="variamos_db_aws_main"  # Docker container name for the db

# Restore the database from the backup file using docker exec and psql
docker exec -i $DB_HOST bash -c "PGPASSWORD=$DB_PASSWORD psql -U $DB_USER" < $BACKUP_FILE

echo "Database restoration completed."
