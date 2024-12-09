#!/bin/bash

echo "Verifying connectivity with the server..."
ansible -i inventory.yml all -m ping

echo "Running playbook..."
ansible-playbook -i inventory.yml playbook.yml
