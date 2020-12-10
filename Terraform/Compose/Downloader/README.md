# terraform-vsphere-standalone

## vSphere 6.7 Upgrade class

## Usage
```bash
# Set your Azure Blob Access Key environment variable
export ARM_ACCESS_KEY=<stored in 1Password>

# Make sure that terraform is setup
terraform init

Rename secret.auto.tfvars.template to secret.auto.tfvars and add your personal credentials
```

After terraform is setup you can deploy the instructor environment. Make sure that VMs work with the correct network, update templates, etc.
```bash
# Build the network in NSX-T
# Useful for building instructor pod0 repetitively for testing
terraform plan
terraform apply
# terraform apply -auto-approve
```

Once templates are ready, and cloned. Update the terraform.tfvars file in this directory.
Increase *student_count* to the correct number.
```bash
# Build the network in NSX-T
terraform plan -var="student_count=<INT>"
# You may have to apply more than once to verify the network is complete
terraform apply -var="student_count=<INT>" -auto-approve
# Clone the appropriate VMs
terraform apply -var="build_download=true" -auto-approve
# If there are issues E.G. Error:  Failed to read NAT Rule <ID>: Client '<User>' exceeded request rate of 100 per second (code 102)
# -parallelism=5
```

After class is complete, tear down student pods and VMs.
This works because the default pod count is 0, or, just the instructor pod
```bash
# Tear down compute
terraform apply -var="student_count=<INT>" -auto-approve
# Tear down network
terraform apply -auto-approve  
```

Completely destroy all networks including pod0
```bash
# Will likely fail if VMs still exist and are connected to the segments.
terraform destroy
```

Useful commands  
Sometimes you may want to delete just a single item. Use the taint command to mark the item for deletion and re-creation.  
```bash
# Taint a network segment. All VMs need to be disconnected.
terraform taint "module.network.nsxt_policy_segment.VDI[<INT>]"
# Taint server.
# Student count starts at 0. E.G. 0 = POD1
terraform taint "module.compute[0].vsphere_virtual_machine.cloned_virtual_machine_dc[<INT>]"
terraform taint "module.compute[0].vsphere_virtual_machine.cloned_virtual_machine_psc[<INT>]"
terraform taint "module.compute[0].vsphere_virtual_machine.cloned_virtual_machine_vcenter[<INT>]"
terraform taint "module.compute[0].vsphere_virtual_machine.cloned_virtual_machine_freenas[<INT>]"
terraform taint "module.compute[0].vsphere_virtual_machine.cloned_virtual_machine_esx01[<INT>]"
terraform taint "module.compute[0].vsphere_virtual_machine.cloned_virtual_machine_esx02[<INT>]"
```

## Notes

* Sometimes a plan will fail/timeout waiting for a dependent resource to come back as available. NSX-T seems to do this at times. Simply run the same command again and it will clean up the delta of what was missed.

#### Orphaned segments - https://kb.vmware.com/s/article/60303
Sometimes creating / deleting using TF too quickly leaves orphaned network segments.  
They will show up in the list and be grayed out. Status = "Failed" With an error message similar to this.  
* Sep 4, 2020, 8:05:06 AM : One or more relationships exist for object with id LogicalSwitch/<ID> <NAME> .

When you search for the ID you may see objects listed.
* Segments
* Firewaill IPFIX Profile
* Logical Switches

Delete ipfix config
```bash
# Get info about the ipfix profile.
curl -k -u <USER>@ivoxy.net:<PASS> -X GET 'https://nsxt.ivoxy.net/api/v1/ipfix/configs/< ID >'

# Paste the JSON data, changing "applied_tos"
# May have to change priority
curl -k -u <USER>@ivoxy.net:<PASS> -X PUT 'https://nsxt.ivoxy.net/api/v1/ipfix/configs/< ID >' -H "X-Allow-Overwrite: true" -H 'Content-Type: application/json' -d \
'{
...
  "priority" : 900,
  "applied_tos" : [ ],
...
}'

# Delete the object
curl -k -u <USER>@ivoxy.net:<PASS> -X DELETE 'https://nsxt.ivoxy.net/api/v1/ipfix/configs/< ID >' -H "X-Allow-Overwrite: true"
```

## Example Deployments

* CentOS 7: https://blog.inkubate.io/create-a-centos-7-terraform-template-for-vmware-vsphere/
* Ubuntu LTS 16.04: https://blog.inkubate.io/create-a-ubuntu-16-04-terraform-template-for-vmware-vsphere/
* Ubuntu LTS 18.04: https://blog.inkubate.io/create-a-ubuntu-18-04-terraform-template-for-vmware-vsphere/

## File Descriptors

* versions.tf
Establish which providers are in use (vSphere, NSX-T) and the desired version of Terraform

* variables.tf
Skeleton file that establishes variables that will be used

* terraform.tfvars
A place to set variables established in variables.tf

* main.tf
Main state file

* output.tf
Data shown at completion of plan execution

## ToDo
- [ ] Second octet variable for running multiple classes at the same time
- [ ] Reference admin username/password from a top level directory
- [ ] Consider building networks with a variable instead. E.G. var.networks = {[name=net1, ip=10.0.0.0/24], [name=net2, ip=10.0.1.0/24], } Basically define everything in a variable?
- [ ] Variables defined for compute clone
- [ ] Pod folder location in vCenter
- [ ] Custom tfstate files based on class name per fork?
- [ ] Consider leveraging Vault for secrets
