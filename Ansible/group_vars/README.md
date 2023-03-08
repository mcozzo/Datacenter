# Working with Vault
Because I keep forgetting.

## Prerequisites
* https://docs.ansible.com/ansible/latest/user_guide/vault.html
```bash
# Encrypt
ansible-vault encrypt --vault-password-file /Users/mattcozzolino/GitHub/Cozzo/vars/ansible-vault.datacenter.cozzo.net.txt vault.yml
# Decrypt
ansible-vault decrypt --vault-password-file /Users/mattcozzolino/GitHub/Cozzo/vars/ansible-vault.datacenter.cozzo.net.txt vault.yml
```
