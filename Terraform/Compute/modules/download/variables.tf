
variable "vm_template" {
  default = "TPL_Ubuntu_1804"
}

variable "network_name" {
  default = "dvsDC01-014-Docker"
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







variable "vsphere_datacenter" {
  default = "NULL"
}
variable "vsphere_resource_pool" {
  default = "NULL"
}
variable "vsphere_datastore" {
  default = "NULL"
}
variable "vsphere_folder" {
  default = "NULL"
}
variable "module_folder" {
  default = "NULL"
}
