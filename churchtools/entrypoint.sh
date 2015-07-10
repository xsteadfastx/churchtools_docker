#!/bin/bash
ansible-playbook -i /tmp/ansible/hosts /tmp/ansible/entrypoint.yml -c local
supervisord
