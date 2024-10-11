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

**Result**

prod_server | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3.10"
    },
    "changed": false,
    "ping": "pong"
}


