#===============================================================================
# User credentials
#===============================================================================

admin_username = "svc-FirstLast@cozzo.net"
admin_password = "xxxxxxxxxxxxxxxxxxxxxxx"

#===============================================================================
# Environment settings
#===============================================================================

nsxt_host       = "172.16.2.90"
#vsphere_server  = "10.11.0.101"
vsphere_server  = "vcenter.dc.cozzo.net"
class_name      = "NABP"
student_count   = 5

#===============================================================================
# VMware vSphere configuration
#===============================================================================

vsphere_datacenter = "WOW-Rack"
vsphere_datastore = "vSAN-DC"
vsphere_resource_pool = "DC.cozzo.net/Resources"
vsphere_folder = "Terraform"

# Prefix to use for the class 10.x[.0.0]
subnet_prefix   = "10.2"
#pod_dns         = ["10.0.120.10", "172.16.2.11"]
pod_dns         = ["10.11.14.4", "10.11.14.5"]

#Names of VM Templates
vsphere_virtual_machine_template_vm_01 = "GNS3VM-2216-Ansible-GNS3"
vsphere_virtual_machine_template_vm_02 = "Ubuntu-2004-Ansible-Engine"
vsphere_virtual_machine_template_vm_03 = "Ubuntu-2004-Ansible-Gitlab"
vsphere_virtual_machine_template_vm_04 = "Ubuntu-2004-Ansible-Tower"
#vsphere_virtual_machine_template_vm_05 = "WIN10-2004-Ansible-VDI "
#vsphere_virtual_machine_template_vm_06 = "ivoxy-vcenter-01-TrainingPod-Template"

#Names of cloned VMs from Templates
vsphere_virtual_machine_name_vm_01 = "GNS3"
vsphere_virtual_machine_name_vm_02 = "Engine"
vsphere_virtual_machine_name_vm_03 = "Gitlab"
vsphere_virtual_machine_name_vm_04 = "Tower"
#vsphere_virtual_machine_name_vm_05 = "WIN10-2004-Ansible-VDI "
#vsphere_virtual_machine_name_vm_06 = "vCenter"

#===============================================================================
# Script variables
#===============================================================================

build_download = false
build_plex     = false
