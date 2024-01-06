# Manage the Datacenter
This playbook is to manage the common tasks in the datacenter. It's broken up into unique groups of tasks that are called out by specific files. Roles should be designed to be reused.

## Prerequisites
* Virtual Environment
```bash
# Create
python -m venv /Users/mattcozzolino/python/cozzo-ansible
# Activate
source /Users/mattcozzolino/python/cozzo-ansible/bin/activate
# Deactivate
deactivate
```


* https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html
```bash
# https://galaxy.ansible.com/google/cloud
ansible-galaxy collection install google.cloud
# https://galaxy.ansible.com/community/crypto
ansible-galaxy collection install community.crypto
# Gluster
# https://docs.ansible.com/ansible/latest/collections/gluster/gluster/gluster_volume_module.html
ansible-galaxy collection install gluster.gluster
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
~~#ansible-playbook -i x.x.x.x, tpl-sysprep-0-cleaninstall.yml -e "ansible_user=usr-build" -K -k~~
ansible-playbook -i x.x.x.x, tpl-sysprep-0-cleaninstall.yml -e "remote_user=usr-build" -K -k
ansible-playbook -i x.x.x.x, tpl-sysprep-0-cleaninstall.yml -e "ansible_user=ubuntu" -K -k

# Use this play to install whatever else is needed in the template
ansible-playbook -i x.x.x.x, tpl-sysprep-1-apps.yml
# install other things and sysprep
# sysprep the system
ansible-playbook -i x.x.x.x, tpl-sysprep-2-sysprep.yml
```

## Docker
Setup and run docker containers

```bash
# Configure storage, iSCSI, NFS, OCFS2
ansible-playbook -i ./hosts/host.yml tpl-docker-0-storage.yml
# Configure docker, start containers
ansible-playbook -i ./hosts/host.yml tpl-docker-1-host.yml --extra-vars "trident_password=foo"


# Restart conainers. Probably want to limit the scope.
ansible-playbook -i ./hosts/host.yml tpl-docker-2-restart.yml --limit plex
```

## Google DNS
### Prerequisites
* https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html
Install google plugins
```bash
# Install ansible, requests, google-auth
python3 -m pip install ansible requests google-auth --force
# https://galaxy.ansible.com/google/cloud
# https://galaxy.ansible.com/community/crypto
ansible-galaxy collection install community.crypto --force
# Install additional python stuff (This needs to be done outside of the venv)
```
* Install google cloud, remember to update the path variable.
```bash
# https://cloud.google.com/sdk/docs/quickstart
# Download version, Extract
~/google-cloud-sdk/.install.sh
# Let it finish installing
gcloud init
```


## Daily operations

Valid hosts: nginx, docker_dns, downloader, plex, dev, docker_camp, docker_trident, docker_md, virtual_machines, dns01, dns02, raspberry_pi, travel_pi, reverse_proxy

```bash
# Activate
source /Users/mattcozzolino/python/cozzo-ansible/bin/activate
# Run
ansible-playbook -i ./hosts/host.yml tpl-docker-2-restart.yml --limit plex
# Deactivate
deactivate
```
