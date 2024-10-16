# Configuration Management of Variamos Server with Ansible

## Set up Ansible Inventory File in the Ansible Control Node (Admin Workstation)

1. Add the following line to /etc/host file in the Ansible Control Node

`sudo nano /etc/hosts`

2. **OPTIONAL** Install  sshpass on Mac. 

`brew install esolitos/ipa/sshpass`

3. Set the environment. The .env file contains the credentials

`source .env`

4. List the inventory

`ansible-inventory -i variamos-inventory.yaml --list`

5. Ping all the servers on the inventory

`ansible all -m ping -i variamos-inventory.yaml -e admin_user="$ADMIN_USER" -e admin_password="$ADMIN_PASSWORD"`

`ansible all -m ping -i variamos-inventory.yaml`

**Result**

prod_server | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3.10"
    },
    "changed": false,
    "ping": "pong"
}


## Install Docker and Docker Compose on the server ceis.variamos.com

`source .env`

`ansible-playbook -i variamos-inventory.yaml docker-prod-playbook.yaml -e admin_user="$ADMIN_USER" -e admin_password="$ADMIN_PASSWORD" -e ansible_become_pass="$ADMIN_PASSWORD"`

## Error001 2024/10/16

### **Description:**

After run the folloiwng command:

`ansible all -m ping -i variamos-inventory.yaml -e admin_user="$ADMIN_USER" -e admin_password="$ADMIN_PASSWORD"`

The error was:

prod_server | UNREACHABLE! => {
"changed": false,
"msg": "mkdir: cannot create directory '/home/oaguayo/.ansible/tmp/ansible-tmp-1729089052.976091-74320-86313493934759': **No space left on device\n"**,
"unreachable":

### Solution

1. Informed the issue to Oscar recomended to increase in 2X the disk space.

2. Connect to the server via SSH

`ssh [user]@ceis.variamos.com`

3. Run command to verify the space available

`df -h`

5. Remove Unnecessary Files and Packages:

`sudo apt autoremove`

`sudo apt clean`

`sudo apt autoclean`

6. Get the current linux kernel in the server

`uname -r`

7. List all installed kernels

`dpkg --list | grep linux-image`

8. Remove rc linux kernels

`sudo apt remove --purge linux-image-5.15.0-107-generic`
`sudo apt remove --purge linux-image-5.15.0-112-generic`
`sudo apt remove --purge linux-image-5.15.0-113-generic`
`sudo apt remove --purge linux-image-5.15.0-116-generic`
`sudo apt remove --purge linux-image-5.15.0-117-generic`
`sudo apt remove --purge linux-image-5.15.0-118-generic`
`sudo apt remove --purge linux-image-5.15.0-119-generic`

9. Prune the journal logs using journalctl:

`sudo journalctl --vacuum-time=2weeks`

`sudo journalctl --vacuum-size=500M`

