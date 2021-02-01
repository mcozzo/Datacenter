# Search and replace "_vm_01" with "_vm_0x"
# Delete "/*" to uncomment the section and enable
variable "vm_name_03" {
  default = "Downloader03"
}
variable "vm_ip_03" {
  default = "10.11.14.33"
}

#===============================================================================
# Clone VM
#===============================================================================

resource "vsphere_virtual_machine" "cloned_virtual_machine_03" {
  name             = "TF_${var.vm_name_03}"
  #name             = "TFDL01"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  folder           = vsphere_folder.folder.path
  guest_id         = data.vsphere_virtual_machine.template.guest_id

  num_cpus                   = 1
  num_cores_per_socket       = 1
  memory                     = 4096
  boot_delay                 = 0
  force_power_off            = true
  #nested_hv_enabled          = true
  #hv_mode                    = "hvAuto"
  #wait_for_guest_net_timeout = 20

  scsi_type = data.vsphere_virtual_machine.template.scsi_type
  firmware  = data.vsphere_virtual_machine.template.firmware

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label = "disk0"
    #eagerly_scrub    = data.vsphere_virtual_machine.template.disks[0].eagerly_scrub
    #thin_provisioned = data.vsphere_virtual_machine.template.disks[0].thin_provisioned
    eagerly_scrub    = false
    thin_provisioned = true
    size = data.vsphere_virtual_machine.template.disks.0.size
  }

  #disk {
  #  label = "disk1"
  #  unit_number = 1
  #  #eagerly_scrub    = data.vsphere_virtual_machine.template.disks[1].eagerly_scrub
  #  #thin_provisioned = data.vsphere_virtual_machine.template.disks[1].thin_provisioned
  #  eagerly_scrub    = false
  #  thin_provisioned = true
  #  size = data.vsphere_virtual_machine.template.disks.1.size
  #}

  #cdrom {
  #  datastore_id = data.vsphere_datastore.software.id
  #  path         = "vCenter_ISO/VMware-VCSA-all-6.7.0-16046470.iso"
  #}

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    timeout       = 60
    customize {
      linux_options {
        #host_name = "TF_${var.vm_name_03}"
        #host_name = "TF-Downloader01"
        host_name = var.vm_name_03
        domain    = var.network_domain
      }
      network_interface {
        ipv4_address = var.vm_ip_03
        ipv4_netmask = var.network_mask
      }
      ipv4_gateway = var.network_gateway
      dns_server_list = var.dns_servers
      #dns_suffix_list = var.network_domain
    }
  }
  tags = ["${data.vsphere_tag.tag.id}"]
  #tags = ["${vsphere_tag.tag.id}"]
}# */
