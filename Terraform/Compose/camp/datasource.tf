#===============================================================================
# Template VM
#===============================================================================

## Template data sources

data "vsphere_virtual_machine" "template" {
  #name          = var.vsphere_virtual_machine_template_vm_00
  name          = var.vm_template
  datacenter_id = data.vsphere_datacenter.dc.id
}# */

#===============================================================================
# Data sources
#===============================================================================

data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = var.vsphere_resource_pool
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_folder" "folder" {
#  count         = var.student_count
  path          = "Terraform/TF_${var.module_folder}"
  type          = "vm"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  #name          = "${var.class_name}_POD${count.index+1}-VDI"
  name          = var.network_name
  #name          = data.nsxt_policy_segment_realization.VDI[count.index].network_name
  datacenter_id = data.vsphere_datacenter.dc.id
  #depends_on     = [data.nsxt_policy_segment_realization.VDI]
}

#===============================================================================
# Realize tags
#===============================================================================

data "vsphere_tag_category" "tf-category" {
  name        = "Terraform"
}

data "vsphere_tag" "tf-managed" {
  name        = "terraform-managed"
  category_id = data.vsphere_tag_category.tf-category.id
  #description = "Managed by Terraform"
}

#data "vsphere_tag_category" "category_class" {
#  name        = "Class-Name"
#}
#
#resource "vsphere_tag" "class" {
#  name        = var.class_name
#  category_id = data.vsphere_tag_category.category_class.id
#  description = var.class_name_long
#}
