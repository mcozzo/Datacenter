#===============================================================================
# Provider Base Configuration
#===============================================================================
provider "vsphere" {
  #version = "1.24.2"
  #user           = "${var.vsphere_user}"
  user           = var.admin_username
  #password       = "${var.vsphere_password}"
  password       = var.admin_password
  vsphere_server = var.vsphere_server
  allow_unverified_ssl = true
}

#provider "nsxt" {
#  version = "3.1.0"
#  host                     = var.nsxt_host
#  #username                 = "${var.nsxt_username}"
#  username                 = var.admin_username
#  #password                 = var.nsxt_password
#  password                 = var.admin_password
#  allow_unverified_ssl     = true
#  max_retries              = 25
#  retry_min_delay          = 500
#  retry_max_delay          = 20000
#  retry_on_status_codes    = [429]
#}

#module "network" {
#	source = "./modules/network"
#
##  admin_username = var.admin_username
##  admin_password = var.admin_password
#  student_count = var.student_count
#  class_name    = var.class_name
#  subnet_prefix = var.subnet_prefix
#  pod_dns       = var.pod_dns
#
#	providers = {
#		nsxt = nsxt
#	}
#}

/*
module "download" {
  count = var.build_download ? 1 : 0
  source = "./modules/download"

  vsphere_datacenter    = var.vsphere_datacenter
  vsphere_resource_pool = var.vsphere_resource_pool
  vsphere_datastore     = var.vsphere_datastore
  vsphere_folder        = var.vsphere_folder
  #module_folder         = "Download"
  #network               = "dvsDC01-014-Docker"

	providers = {
		vsphere = vsphere
	}
} # */

#===============================================================================
# Assign a tag
#===============================================================================

data "vsphere_tag_category" "category" {
  name        = "Terraform"
  #cardinality = "SINGLE"
  #description = "Managed by Terraform"

  #associable_types = [
  #  "VirtualMachine",
  #  "Datastore",
  #]
}

data "vsphere_tag" "tag" {
  name        = "terraform-managed"
  category_id = data.vsphere_tag_category.category.id
  #description = "Managed by Terraform"
}

#===============================================================================
# Template VM
#===============================================================================

## Template data sources

data "vsphere_virtual_machine" "template" {
  #name          = var.vsphere_virtual_machine_template_vm_00
  name          = var.vm_template
  datacenter_id = data.vsphere_datacenter.dc.id
}# */
