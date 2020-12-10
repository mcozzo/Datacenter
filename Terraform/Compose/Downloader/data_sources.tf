

#===============================================================================
# vSphere Configuration
#===============================================================================

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
  path          = "Terraform/${var.module_folder}"
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
