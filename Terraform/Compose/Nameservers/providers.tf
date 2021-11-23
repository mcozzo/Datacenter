terraform {
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
      version = "1.24.2"
    }
  }
  required_version = ">= 0.13"
}
