# VariamosAwsServer

In this documentation you will find how-to setup an ubuntu server to run Variamos.

## Docker Installation

### 1. Install Docker**

- sudo apt update
- sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
- curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
- echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
- sudo apt update
- sudo apt install -y docker-ce docker-ce-cli containerd.io
- sudo systemctl start docker
- sudo systemctl enable docker

### 2. Install Docker Compose

- sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
- sudo chmod +x /usr/local/bin/docker-compose
- docker-compose --version

### 3. Create files

nano .aws.develop.env
nano docker-compose-aws-develop.yml

### 4. Connect via FTP

- Use FileZille

**Protocol:** SFTP
**SErver:** ec2-3-130-187-131.us-east-2.compute.amazonaws.com
**Access Mode:** Key File
**Key File:** /Users/jairosoto/code/Jsoto/Variamos/DevOps/VariamosAwsServer/variamos_prd.pem

### 5. Create variamos_develop swarm

sudo docker compose --env-file .env.aws.develop -f docker-compose-aws-develop.yml up -d

### 6. WARINING destroy the instalation

sudo docker compose --env-file .env.aws.develop -f docker-compose-aws-develop.yml down

### 7. View the status of variamos_develop swarm

sudo docker-compose --env-file .env.aws.develop -f docker-compose-aws-develop.yml ps

### 8. Pull the latest versions of the images

sudo docker compose --env-file .env.aws.develop -f docker-compose-aws-develop.yml pull

### 9. Stop and start the service

**WARNING: the down option destroys all data and volumes** 

sudo docker compose --env-file .env.aws.develop -f docker-compose-aws-develop.yml stop
sudo docker compose --env-file .env.aws.develop -f docker-compose-aws-develop.yml start

### 10. Restart your containers

sudo docker compose --env-file .env.aws.develop -f docker-compose-aws-develop.yml up -d

## Setup GitRHub self hosted funner

**Runner image:** Linux
**Architecture:** ARM64/x64

### 11. Update docker compose services with upodate definition of docker compose file

**Set the environments vars**
source .env.aws.develop 

**Pull the images**

sudo docker compose --env-file .env.aws.develop -f docker-compose-aws-develop.yml pull

**Run docker compose with the option up**
sudo docker compose --env-file .env.aws.develop -f docker-compose-aws-develop.yml up -d

**Check the containers running**
sudo docker-compose --env-file .env.aws.develop -f docker-compose-aws-develop.yml ps


**Download**

mkdir actions-runner && cd actions-runner

curl -o actions-runner-linux-x64-2.311.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.311.0/actions-runner-linux-x64-2.311.0.tar.gz

echo "29fc8cf2dab4c195bb147384e7e2c94cfd4d4022c793b346a6175435265aa278  actions-runner-linux-x64-2.311.0.tar.gz" | shasum -a 256 -c

tar xzf ./actions-runner-linux-x64-2.311.0.tar.gz

**Configure**

./config.sh --url https://github.com/variamosple --token AJ5A2HTWNITZLUK26JYV5ETFMVO6I

sudo chmod 666 /var/run/docker.sock

./run.sh

**Execute the runner if it is stoped after rebbot the system**

**Runs it once and then reboot the system**
sudo usermod -aG docker $USER

cd actions-runner/
./run.sh
close de tereminal

## Restore database

**View the logs on db container**
sudo docker logs variamos_db_aws_develop
sudo docker logs variamos_pgadmin_aws_develop

**Open the terminal of the DB in the container**
sudo docker exec -it variamos_db_aws_develop /bin/bash

psql -h 127.0.0.1 -p 5432 -U adminpg -d VariamosDB

## Errors

### ERROR 20231127 01

**Solution:**

sudo docker compose --env-file .env.aws.develop -f docker-compose-aws-develop.yml up -d

**Description:**

WARN[0000] The "VARIAMOS_MS_LANGUAGES_DB_HOST" variable is not set. Defaulting to a blank string. 
WARN[0000] The "VARIAMOS_MS_LANGUAGES_DB_DATABASE" variable is not set. Defaulting to a blank string. 

### ERROR 20231201 01

**command**
sudo docker compose --env-file .env.aws.develop -f docker-compose-aws-develop.yml up -d

After run the option up the container **vms_domain_application_aws_develop** shows that is **Started** buth after run ps option the contanier is not showed.

**View containter status**

**View running containers**

docker ps -a

09d0209db792   jasotov/vms_domain_application:main     "docker-entrypoint.s…"   8 hours ago   **Exited (1)** 5 seconds ago 

**View container logs**

docker logs vms_domain_application_aws_develop

**Shell**

docker exec -it vms_domain_application_aws_develop /bin/sh


**Result**

> autocomplete@1.0.0 start
> node index.js

node:internal/modules/cjs/loader:1031
  throw err;
  ^

Error: Cannot find module '/vms_domain_application/index.js'
    at Function.Module._resolveFilename (node:internal/modules/cjs/loader:1028:15)
    at Function.Module._load (node:internal/modules/cjs/loader:873:27)
    at Function.executeUserEntryPoint [as runMain] (node:internal/modules/run_main:81:12)
    at node:internal/main/run_main_module:22:47 {
  code: 'MODULE_NOT_FOUND',
  requireStack: []
}

> autocomplete@1.0.0 start
> node index.js

node:internal/modules/cjs/loader:1031
  throw err;
  ^

Error: Cannot find module '/vms_domain_application/index.js'
    at Function.Module._resolveFilename (node:internal/modules/cjs/loader:1028:15)
    at Function.Module._load (node:internal/modules/cjs/loader:873:27)
    at Function.executeUserEntryPoint [as runMain] (node:internal/modules/run_main:81:12)
    at node:internal/main/run_main_module:22:47 {
  code: 'MODULE_NOT_FOUND',
  requireStack: []
}

> autocomplete@1.0.0 start
> node index.js

node:internal/modules/cjs/loader:1031
  throw err;
  ^

Error: Cannot find module '/vms_domain_application/index.js'
    at Function.Module._resolveFilename (node:internal/modules/cjs/loader:1028:15)
    at Function.Module._load (node:internal/modules/cjs/loader:873:27)
    at Function.executeUserEntryPoint [as runMain] (node:internal/modules/run_main:81:12)
    at node:internal/main/run_main_module:22:47 {
  code: 'MODULE_NOT_FOUND',
  requireStack: []
}

> autocomplete@1.0.0 start
> node index.js

node:internal/modules/cjs/loader:1031
  throw err;
  ^

Error: Cannot find module '/vms_domain_application/index.js'
    at Function.Module._resolveFilename (node:internal/modules/cjs/loader:1028:15)
    at Function.Module._load (node:internal/modules/cjs/loader:873:27)
    at Function.executeUserEntryPoint [as runMain] (node:internal/modules/run_main:81:12)
    at node:internal/main/run_main_module:22:47 {
  code: 'MODULE_NOT_FOUND',
  requireStack: []
}

**Solution**

**Set the environments vars**
source .env.aws.develop 

**Pull the images**

sudo docker compose --env-file .env.aws.develop -f docker-compose-aws-develop.yml pull

**Run docker compose with the option up**
sudo docker compose --env-file .env.aws.develop -f docker-compose-aws-develop.yml up -d

docker run -p 4040:4000 --name test_variamos_domain jasotov/vms_domain_application:main

