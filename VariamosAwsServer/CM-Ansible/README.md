# DevOps/VariamosAwsServer/CM-Ansible

## Connect to servers

Production

`ssh -i variamos_prd.pem ubuntu@ec2-3-130-187-131.us-east-2.compute.amazonaws.com`

Development

`ssh -i variamos_prd.pem ubuntu@ec2-3-18-161-123.us-east-2.compute.amazonaws.com`

## 1. Install Ansible in Controller Node

In this scenario **F45.local** is the Ansible Controller Node.

`brew install python3`
`pip3 install pipx`
`pip3 install ansible`

## 2. Add the Variamos Server "variamos-server" to the /etc/hosts

## 3. Create the Inventory

`nano variamos-inventory02.ini`

[Variamos-Hosts]
variamosserver   

## 4. List the inventory

`ansible-inventory -i variamos-inventory02.yaml --list`

## 5. Ping to all servers in the inventory

`ansible all -m ping -i variamos-inventory02.yaml`

`ansible dev -m ping -i variamos-inventory02.yaml`

`ansible prod -m ping -i variamos-inventory02.yaml`

## 6. Execute a PlayBook

`ansible-playbook -i inventory.yaml playbook.yaml`

# 2024/08/22 Install requeriments on deve server.

## Add 3.18.161.123 Development Server to Ansible

## Add 3.18.161.123 to hosts on Controller

3.18.161.123    variamosserverdev

`sudo nano /etc/hosts`

## Add server: variamosserverdev to variamos-inventory02.yaml

## Install Docker in Development Server

`ansible-playbook -i variamos-inventory02.yaml docker-dev-playbook.yaml`

## Install Nginx in Development Server

`ansible-playbook -i variamos-inventory02.yaml nginx-dev-playbook.yaml`

## backup the database

Connexion: 

    VARIAMOS_MS_LANGUAGES_DB_HOST="variamos_db"
    VARIAMOS_MS_LANGUAGES_DB_DATABASE="VariamosDB" 
    VARIAMOS_MS_LANGUAGES_DB_PORT=5432
    VARIAMOS_MS_LANGUAGES_DB_SSL="false"
    VARIAMOS_MS_LANGUAGES_DB_USER="adminpg" 
    VARIAMOS_MS_LANGUAGES_DB_PASSWORD="############"

  dbaws:
    image: postgres:14.8
    container_name: variamos_db_aws_develop
    hostname: variamos_db
    restart: always
    environment:
      POSTGRES_PASSWORD: ${VARIAMOS_MS_LANGUAGES_DB_PASSWORD}
      POSTGRES_USER: ${VARIAMOS_MS_LANGUAGES_DB_USER}
      POSTGRES_SSL: ${VARIAMOS_MS_LANGUAGES_DB_SSL}
    ports:
      - "5433:${VARIAMOS_MS_LANGUAGES_DB_PORT}"
    volumes:
      - variamos_pgdata_aws_develop:/var/lib/postgresql/develop/variamosdevelopdata148
    networks:
      - variamosnet_aws_develop

`ansible-playbook -i variamos-inventory02.yaml backupdb-prod-playbook.yaml`

### Check the DB Backups

1. Connect to prod server

`ssh -i variamos_prd.pem ubuntu@ec2-3-130-187-131.us-east-2.compute.amazonaws.com`

2. List the files in the backup folder

`ls -l /home/ubuntu/backupdb`

**Result**

- Empty files
- Bad name with extension as .sqll

-rw-r--r-- 1 root root 0 Sep  7 02:00 db_backup_2024-09-07-02-00-01.sqll
-rw-r--r-- 1 root root 0 Sep  8 02:00 db_backup_2024-09-08-02-00-01.sqll
-rw-r--r-- 1 root root 0 Sep  9 02:00 db_backup_2024-09-09-02-00-01.sqll
-rw-r--r-- 1 root root 0 Sep 10 02:00 db_backup_2024-09-10-02-00-01.sqll
-rw-r--r-- 1 root root 0 Sep 11 02:00 db_backup_2024-09-11-02-00-01.sqll
-rw-r--r-- 1 root root 0 Sep 12 02:00 db_backup_2024-09-12-02-00-01.sqll
-rw-r--r-- 1 root root 0 Sep 13 02:00 db_backup_2024-09-13-02-00-01.sqll
-rw-r--r-- 1 root root 0 Sep 14 02:00 db_backup_2024-09-14-02-00-01.sqll
-rw-r--r-- 1 root root 0 Sep 15 02:00 db_backup_2024-09-15-02-00-01.sqll

`sudo /usr/local/bin/dbbackup-prod.sh`

**Result:**

Error response from daemon: No such container: variamos_db_aws_develop

**Solution:**

`docker ps --filter="NAME=db"`

ubuntu@ip-172-31-5-155:~$ docker ps --filter="NAME=db"
CONTAINER ID   IMAGE           COMMAND                  CREATED        STATUS        PORTS                                       NAMES
798150a38bbb   postgres:14.8   "docker-entrypoint.s…"   5 months ago   Up 2 months   0.0.0.0:5433->5432/tcp, :::5433->5432/tcp   variamos_db_aws_main

Update the name to: **variamos_db_aws_main** in **dbbackup-prod.sh**

Reaply the playbook: **backupdb-prod-playbook.yaml**

`ansible-playbook -i variamos-inventory02.yaml backupdb-prod-playbook.yaml`

Chek the creation of the backup again.

`ssh -i variamos_prd.pem ubuntu@ec2-3-130-187-131.us-east-2.compute.amazonaws.com`

`sudo /usr/local/bin/dbbackup-prod.sh`

-rw-r--r-- 1 root root       0 Sep 15 16:32 db_backup_2024-09-15-16-32-37.sqll
-rw-r--r-- 1 root root **7224486** Sep 15 16:37 db_backup_2024-09-15-16-37-45.**sql**