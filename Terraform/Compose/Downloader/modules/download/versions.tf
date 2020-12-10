terraform {
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
    }
    nsxt = {
      source = "terraform-providers/nsxt"
    }
  }
  required_version = ">= 0.13"
}
