resource "oci_identity_compartment" "root_compartment" {
  compartment_id = var.root_compartment_ocid
  description    = "Nan Budget devops main compartment (permissions)"
  name           = var.project_name
}

resource "oci_identity_compartment" "infra_compartment" {
  compartment_id = oci_identity_compartment.root_compartment.id
  description    = "Nan Budget devops infrastructure compartment"
  name           = "${var.project_name}_infra"
}

output "root_compartment_ocid" {
  value = oci_identity_compartment.root_compartment.id
}

output "infra_compartment_ocid" {
  value = oci_identity_compartment.infra_compartment.id
}