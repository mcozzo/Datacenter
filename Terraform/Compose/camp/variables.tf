#===============================================================================
# User credentials
#===============================================================================

# Set in secret.auto.tfvars
variable "admin_username" {
  default = "svc-FirstLast@ivoxy.net"
}
variable "admin_password" {
  default = "xxxxxxxxxxxxxxxxxxxxxxx"
}

#===============================================================================
# Environment settings
#===============================================================================

variable "nsxt_host" { default = "" }
variable "vsphere_server" { default = "vcenter.dc.cozzo.net" }

#===============================================================================
# VMware vSphere configuration
#===============================================================================

variable "vsphere_datacenter" { default = "Camp.cozzo.net" }
variable "vsphere_datastore" { default = "ESX-01" }
variable "vsphere_resource_pool" { default = "Camp.cozzo.net/Resources" }
variable "vsphere_folder" { default = "docker" }

#===============================================================================
# Environment
#===============================================================================

variable "vm_template" {
  default = "TPL_Ubuntu_2004-version"
}
variable "network_domain" {
  default = "cozzo.net"
}
variable "module_folder" {
  default = "Camp"
}
variable "dns_servers" {
  default = ["10.11.14.4", "10.11.14.5"]
}

# MGMT Network
variable "network_mgmt" {
  default = "V10-MGMT"
}
variable "network_mgmt_gateway" {
  default = "10.21.0.1"
}
variable "network_mgmt_mask" {
  default = "24"
}

# Server network
variable "network_servers" {
  default = "V12-Servers"
}
variable "network_servers_gateway" {
  default = "10.21.2.1"
}
variable "network_servers_mask" {
  default = "24"
}



#===============================================================================
# Class specific variables
#===============================================================================

variable "class_name" { default = "" }
variable "class_name_long" { default = "" }
variable "student_count" { default = "" }
variable "subnet_prefix" { default = "" }
variable "pod_dns" { default = "" }

variable "vsphere_virtual_machine_template_vm_01" { default = "" }
variable "vsphere_virtual_machine_template_vm_02" { default = "" }
variable "vsphere_virtual_machine_template_vm_03" { default = "" }
variable "vsphere_virtual_machine_template_vm_04" { default = "" }
variable "vsphere_virtual_machine_template_vm_05" { default = "" }
variable "vsphere_virtual_machine_template_vm_06" { default = "" }
variable "vsphere_virtual_machine_template_vm_07" { default = "" }
variable "vsphere_virtual_machine_template_vm_08" { default = "" }
variable "vsphere_virtual_machine_template_vm_09" { default = "" }
variable "vsphere_virtual_machine_template_vm_10" { default = "" }

variable "vsphere_virtual_machine_name_vm_01" { default = "" }
variable "vsphere_virtual_machine_name_vm_02" { default = "" }
variable "vsphere_virtual_machine_name_vm_03" { default = "" }
variable "vsphere_virtual_machine_name_vm_04" { default = "" }
variable "vsphere_virtual_machine_name_vm_05" { default = "" }
variable "vsphere_virtual_machine_name_vm_06" { default = "" }
variable "vsphere_virtual_machine_name_vm_07" { default = "" }
variable "vsphere_virtual_machine_name_vm_08" { default = "" }
variable "vsphere_virtual_machine_name_vm_09" { default = "" }
variable "vsphere_virtual_machine_name_vm_10" { default = "" }
