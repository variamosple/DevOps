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

## Setup GitRHub self hosted funner

**Runner image:** Linux
**Architecture:** ARM64/x64

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

cd actions-runner/

./run.sh

close terminal

## Errors

### ERROR 20231127 01

**Solution:**

sudo docker compose --env-file .env.aws.develop -f docker-compose-aws-develop.yml up -d

**Description:**

WARN[0000] The "VARIAMOS_MS_LANGUAGES_DB_HOST" variable is not set. Defaulting to a blank string. 
WARN[0000] The "VARIAMOS_MS_LANGUAGES_DB_DATABASE" variable is not set. Defaulting to a blank string. 
