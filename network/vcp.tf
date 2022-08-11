resource "oci_core_vcn" "main_vcn" {
  compartment_id = var.compatment_ocid
  cidr_blocks    = [local.cidr_blocks["VCP"]]
}

resource "oci_core_subnet" "public_subnet" {
  compartment_id             = var.compatment_ocid
  vcn_id                     = oci_core_vcn.main_vcn.id
  cidr_block                 = local.cidr_blocks["PUBLIC"]
  display_name               = "public_subnet"
  prohibit_public_ip_on_vnic = false
}

resource "oci_core_subnet" "private_subnet" {
  compartment_id             = var.compatment_ocid
  vcn_id                     = oci_core_vcn.main_vcn.id
  cidr_block                 = local.cidr_blocks["PRIVATE"]
  display_name               = "private_subnet"
  prohibit_public_ip_on_vnic = true
}

resource "oci_core_subnet" "management_subnet" {
  compartment_id             = var.compatment_ocid
  vcn_id                     = oci_core_vcn.main_vcn.id
  cidr_block                 = local.cidr_blocks["MANAGEMENT"]
  display_name               = "management_subnet"
  prohibit_public_ip_on_vnic = false
}

locals {
  vcp_subnets_ids = {
    "public_subnet"     = oci_core_subnet.public_subnet.id,
    "private_subnet"    = oci_core_subnet.private_subnet.id,
    "management_subnet" = oci_core_subnet.management_subnet.id
  }
}

output "vcp_subnets_id" {
  value = local.vcp_subnets_ids
}