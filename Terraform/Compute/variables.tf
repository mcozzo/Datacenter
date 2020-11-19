#===============================================================================
# User credentials
#===============================================================================

variable "admin_username" {}
variable "admin_password" {}

#===============================================================================
# Environment settings
#===============================================================================

variable "vsphere_server" {}
variable "nsxt_host" {}
variable "class_name" {}
variable "student_count" {}
variable "subnet_prefix" {}
variable "pod_dns" {}

#===============================================================================
# VMware vSphere configuration
#===============================================================================

variable "vsphere_datacenter" {}
variable "vsphere_resource_pool" {}
variable "vsphere_datastore" {}
variable "vsphere_folder" {}

variable "vsphere_virtual_machine_template_vm_01" {}
variable "vsphere_virtual_machine_template_vm_02" {}
variable "vsphere_virtual_machine_template_vm_03" {}
variable "vsphere_virtual_machine_template_vm_04" {}
#variable "vsphere_virtual_machine_template_vm_05" {}
#variable "vsphere_virtual_machine_template_vm_06" {}

variable "vsphere_virtual_machine_name_vm_01" {}
variable "vsphere_virtual_machine_name_vm_02" {}
variable "vsphere_virtual_machine_name_vm_03" {}
variable "vsphere_virtual_machine_name_vm_04" {}
#variable "vsphere_virtual_machine_name_vm_05" {}
#variable "vsphere_virtual_machine_name_vm_06" {}

#===============================================================================
# Script variables
#===============================================================================

variable "build_download" {}
variable "build_plex" {}
