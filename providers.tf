terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "4.86.1"
    }
  }
}

provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.private_key_fingerprint
  private_key_path = var.private_key_path
  region           = var.oci_region
}