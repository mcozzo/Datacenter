#===============================================================================
# Provider Base Configuration
#===============================================================================
provider "vsphere" {
  version = "1.24.3"
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


#===============================================================================
# Data sources
#===============================================================================

#data "vsphere_datacenter" "dc" {
#  name = var.vsphere_datacenter
#}
#
#data "vsphere_datastore" "datastore" {
#  name          = var.vsphere_datastore
#  datacenter_id = data.vsphere_datacenter.dc.id
#}
#
#data "vsphere_resource_pool" "pool" {
#  name          = var.vsphere_resource_pool
#  datacenter_id = data.vsphere_datacenter.dc.id
#}



#===============================================================================
# Realize NSX-T networks
#===============================================================================

## VDI

#data "nsxt_policy_segment_realization" "VDI" {
#  count = var.student_count + 1
#  #path  = nsxt_policy_segment.VDI[count.index+1].path
#  path = var.nsxt_policy_segment_VDI[count.index].path
#}

#data "vsphere_network" "network_VDI" {
#  count          = var.student_count
#  name          = "${var.class_name}_POD${count.index+1}-VDI"
#  #name          = "${var.nsxt_policy_segment_VDI[count.index+1].network_name}"
#  #name          = data.nsxt_policy_segment_realization.VDI[count.index].network_name
#  datacenter_id = data.vsphere_datacenter.dc.id
#  #depends_on     = [data.nsxt_policy_segment_realization.VDI]
#}

## MGMT

#data "nsxt_policy_segment_realization" "MGMT" {
#  count         = var.student_count + 1
#  path = var.nsxt_policy_segment_MGMT[count.index].path
#}

#data "vsphere_network" "network_MGMT" {
#  count          = var.student_count
#  name          = "${var.class_name}_POD${count.index+1}-MGMT"
#  #name          = "${var.nsxt_policy_segment_MGMT[count.index+1].network_name}"
#  #name          = data.nsxt_policy_segment_realization.MGMT[count.index].network_name
#  datacenter_id = data.vsphere_datacenter.dc.id
#  #depends_on     = [data.nsxt_policy_segment_realization.MGMT]
#}

## vMotion

#data "nsxt_policy_segment_realization" "INT_1" {
#  count         = var.student_count + 1
#  path = var.nsxt_policy_segment_INT_1[count.index].path
#}

#data "vsphere_network" "network_vMotion" {
#  count          = var.student_count + 1
#  #name          = "${var.class_name}_POD${count.index+1}-vMotion"
#  #name          = "${var.nsxt_policy_segment_vMotion[count.index+1].network_name}"
#  name          = data.nsxt_policy_segment_realization.INT_1[count.index].network_name
#  datacenter_id = data.vsphere_datacenter.dc.id
#  depends_on     = [data.nsxt_policy_segment_realization.INT_1]
#}









/*
module "network" {
	source = "./modules/network"

#  admin_username = var.admin_username
#  admin_password = var.admin_password
  student_count = var.student_count
  class_name    = var.class_name
  subnet_prefix = var.subnet_prefix
  pod_dns       = var.pod_dns

	providers = {
		nsxt = nsxt
	}
}#*/

/*
module "compute" {
  count = var.build_compute ? 1 : 0
  source = "./modules/compute"

  #depends_on = [module.network]

  student_count = var.student_count
  class_name    = var.class_name

  # Having to define all of the variables below is really annoying
  # We don't seem to have to do it with the NSX-T provider.
  vsphere_datacenter    = var.vsphere_datacenter
  vsphere_resource_pool = var.vsphere_resource_pool
  vsphere_datastore     = var.vsphere_datastore
  vsphere_folder        = var.vsphere_folder

  vsphere_virtual_machine_template_vm_01 = var.vsphere_virtual_machine_template_vm_01
  vsphere_virtual_machine_template_vm_02 = var.vsphere_virtual_machine_template_vm_02
  vsphere_virtual_machine_template_vm_03 = var.vsphere_virtual_machine_template_vm_03
  vsphere_virtual_machine_template_vm_04 = var.vsphere_virtual_machine_template_vm_04
  #vsphere_virtual_machine_template_vm_05 = var.vsphere_virtual_machine_template_vm_05
  #vsphere_virtual_machine_template_vm_06 = var.vsphere_virtual_machine_template_vm_06
  vsphere_virtual_machine_name_vm_01     = var.vsphere_virtual_machine_name_vm_01
  vsphere_virtual_machine_name_vm_02     = var.vsphere_virtual_machine_name_vm_02
  vsphere_virtual_machine_name_vm_03     = var.vsphere_virtual_machine_name_vm_03
  vsphere_virtual_machine_name_vm_04     = var.vsphere_virtual_machine_name_vm_04
  #vsphere_virtual_machine_name_vm_05     = var.vsphere_virtual_machine_name_vm_05
  #vsphere_virtual_machine_name_vm_06     = var.vsphere_virtual_machine_name_vm_06

  nsxt_policy_segment_VDI     = module.network.nsxt_policy_segment_VDI
  nsxt_policy_segment_MGMT    = module.network.nsxt_policy_segment_MGMT
  nsxt_policy_segment_INT_1   = module.network.nsxt_policy_segment_INT_1
  #nsxt_policy_segment_NFS     = module.network.nsxt_policy_segment_NFS
  #nsxt_policy_segment_iSCSI-A = module.network.nsxt_policy_segment_iSCSI-A
  #nsxt_policy_segment_iSCSI-B = module.network.nsxt_policy_segment_iSCSI-B

	providers = {
		vsphere = vsphere
    nsxt = nsxt
	}
} # */
