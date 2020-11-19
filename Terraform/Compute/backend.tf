#terraform {
#  backend "azurerm" {
#    storage_account_name = "ivoxyterraformstate"
#    container_name       = "2020-nabp-tfstate"
#    key                  = "prod.terraform.tfstate"
#
#    # Access Key is defined as env variable ARM_ACCESS_KEY
#    # You must define this in your environment prior to running terraform operations
#    # Example: export ARM_ACCESS_KEY=<key found in 1pass>
#  }
#}
