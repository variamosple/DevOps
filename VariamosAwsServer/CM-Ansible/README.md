# # DevOps/VariamosAwsServer/CM-Ansible

## 1. Install Ansible in Controller Node

`brew install python3`
`pip3 install pipx`
`pip3 install ansible`

## 2. Add the Variamos Server "variamos-server" to the /etc/hosts

## 3. Create the Inventory

`nano inventory.ini`

[Variamos-Hosts]
variamosserver   

## 4. List the inventory

`ansible-inventory -i inventory.yaml --list`

## 5. Ping to all servers in the inventory

`ansible webservers -m ping -i inventory.yaml`

## 6. Execute a PlayBook

`ansible-playbook -i inventory.yaml playbook.yaml`