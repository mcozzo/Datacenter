resource "vsphere_tag_category" "category" {
  name        = "terraform"
  cardinality = "SINGLE"
  description = "Managed by Terraform"

  associable_types = [
    "VirtualMachine",
    "Datastore",
  ]
}

resource "vsphere_tag" "tag" {
  name        = "terraform-managed"
  category_id = "${vsphere_tag_category.category.id}"
  description = "Managed by Terraform"
}
