# Ansible Dockerfile
Run ansible directly in the cluster i.e. as deployment script after a successful build

## Usage:
Working directory is `/home/ansible`.
The inventory is set to contain only `localhost` (as it is intended to run `kubernetes.core.k8s[_info]` packages)

__Hint:__ use `connection: local` in your playbooks. Otherwise ansible will attempt to ssh into localhost.
(If you know how to set this in ansible.cfg or the inventory, please let me know via issue)

### Environment variable `$PLAYBOOK`
Runs `ansible-playbook $PLAYBOOK`

### Directory `run`
Runs `ansible-playbook run/main.yaml`. Mount the ansible scripts to `/home/ansible/run`

### File `run.yaml`
Runs `ansible-playbook run.yaml`.

### File `main.yaml`
Runs `ansible-playbook main.yaml`.

### Environment variable `$SLEEP`
Runs `sleep $SLEEP`. Useful for debugging purposes.
Use `kubectl exec -it -n <namespace> <podname> -- ash` to log into the instance and run ansible commands from there.

## Builtins
See `builtins` folder for built in yaml files.
Some examples:

### deletePodsByImage.yaml
Delete all pods wich run `$TARGET_IMAGE` (env variable).
Set `PLAYBOOK` to `builtin/deletePodsByImage.yaml`

