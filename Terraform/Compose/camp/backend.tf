# https://www.terraform.io/docs/backends/types/gcs.html

terraform {
  backend "gcs" {
    bucket  = "tf-dc.cozzo.net"
    prefix  = "terraform/camp"
    # gcloud auth application-default login
    ## Doesn't work
    ## export GOOGLE_APPPLICATION_CREDENTIALS=/Users/mattcozzolino/GitHub/vars/cozzo-dns-8f248ebc58f2.json
  }
}
#
