# Project Autoinstall

This repository provides a modular, automated approach to deploying system configurations and dotfiles using Ansible.

> It includes my dotfiles and system configuration, so the package list is meant for reference only. It should work for any system but it is compatible with CachyOS.

## Project Architecture
```
autoinstall/
├── hosts.ini           
├── setup.yml           
├── group_vars/
│   └── all.yml          
└── roles/
├── system/         
│   └── tasks/
│       └── main.yml
└── dotfiles/        
├── tasks/
│   └── main.yml
└── files/      
```

## Prerequisites

On the target machine, ensure Python is installed:
```
sudo pacman -S python
```

## Configuration
Update the inventory file (hosts.ini) with your target machine's details:
```hosts.ini
[vm]
host_ip_address ansible_user=your_username
```

Set the target host in setup.yml:
```yaml
---
- name: Autoinstall dotfiles
  hosts: vm
  roles:
    - dotfiles
    - system
```


## Deployment

After configuring SSH keys (e.g., using ssh-copy-id user@192.168.X.X), verify the connection:
```
ansible -i hosts.ini vm -m ping
```
The expected successful response is:
```text
192.168.122.170 | SUCCESS => {
"ansible_facts": {
"discovered_interpreter_python": "/usr/bin/python3"
},
"changed": false,
"ping": "pong"
}
```

Finally, run the playbook to apply the configuration:
```
ansible-playbook -i hosts.ini setup.yml --ask-become-pass
```
