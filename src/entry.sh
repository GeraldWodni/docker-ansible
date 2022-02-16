#!/bin/ash

if [ -n "$PLAYBOOK" ]; then
    ansible-playbook $PLAYBOOK
elif [ -d "run" ]; then
    ansible-playbook run/main.yaml
elif [ -f "run.yaml" ]; then
    ansible-playbook run.yaml
elif [ -f "main.yaml" ]; then
    ansible-playbook main.yaml
elif [ -n "$SLEEP" ]; then
    sleep $SLEEP
else
    echo "No runable yaml found. Set PLAYBOOK to a valid yaml, or SLEEP if you need a manual running system"
fi

