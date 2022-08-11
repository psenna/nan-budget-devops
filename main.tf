locals {
  root_compartment_ocid = try(var.root_compartment_ocid, var.tenancy_ocid)
}

module "security" {
  source = "./security"

  root_compartment_ocid = var.root_compartment_ocid
  project_name          = var.project_name
}

module "network" {
  source = "./network"

  compatment_ocid = module.security.infra_compartment_ocid
  vcp_base_addr   = var.vcp_base_addr
}