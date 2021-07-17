#===============================================================================
# User credentials
#===============================================================================

variable "admin_username" {}
variable "admin_password" {}

#===============================================================================
# Environment
#===============================================================================

variable "vm_template" {
  default = "TPL_Ubuntu_2004"
}
variable "network_name" {
  default = "dvsDC01-014-Docker"
  #default = "NSX-014-Docker"
}
variable "network_domain" {
  default = "cozzo.net"
}
variable "network_gateway" {
  default = "10.11.14.1"
}
variable "network_mask" {
  default = "24"
}
variable "module_folder" {
  default = "Downloader"
}
variable "dns_servers" {
  default = ["10.11.14.4", "10.11.14.5"]
}

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
