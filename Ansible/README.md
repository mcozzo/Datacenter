# Manage the Datacenter
This playbook is to manage the common tasks in the datacenter. It's broken up into unique groups of tasks that are called out by specific files. Roles should be designed to be reused.

## Prerequisites
* https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html
```bash
# https://galaxy.ansible.com/google/cloud
ansible-galaxy collection install google.cloud
# https://galaxy.ansible.com/community/crypto
ansible-galaxy collection install community.crypto
```

Install google cloud, remember to update the path variable.
* https://cloud.google.com/sdk/docs/quickstart

## Generate certificates with LetsEncrypt
This is designed to be ran locally from my macbook. It uses the NGINX server to do the cert work and the local machine to update GCP DNS.

```bash
# Generate Certificates
ansible-playbook -i ./hosts/host.yml LE-1-GenCerts.yml
# Startup NGINX
ansible-playbook -i ./hosts/host.yml LE-2-StartNGINX.yml
```

## Ubuntu template
This should prepare an Ubuntu VM template.

```bash
# Initial install, use the build account, and then clean up.
# Run service account creation
ansible-playbook -i x.x.x.x, tpl-0-cleaninstall.yml -e "ansible_ssh_user=usr-build" -K
ansible-playbook -i x.x.x.x, tpl-0-cleaninstall.yml --tags users-clean
# Use this play to install whatever else is needed in the template
ansible-playbook -i x.x.x.x, tpl-1-apps.yml
# install other things and sysprep
# sysprep the system
ansible-playbook -i x.x.x.x, tpl-2-sysprep.yml
```









## How to run
```bash
# Generally run like This
ansible-playbook -i hosts.yml play.yml
# Initial install, use the build account, and then clean up.
# Run service account creation
ansible-playbook -i hosts.yml play.yml --tags users-new -e "ansible_ssh_user=usr-build" -K
# Give the system some time after reboot, then cleanup the build user
ansible-playbook -i hosts.yml play.yml --tags users-clean
# Run sysprep tasks
ansible-playbook -i hosts.yml play.yml --tags sysprep
# Or
ansible-playbook -i hosts.yml play.yml --tags sysprep,shutdown
```
## TODO
[ ] User list variable

## Save Yo Shit!
```bash
git add *
git commit -m "<Change This>"
git push -u origin master
```
