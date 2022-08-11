variable "tenancy_ocid" {
  type = string
}

variable "root_compartment_ocid" {
  type    = string
  default = null
}

variable "project_name" {
  type    = string
  default = "nan_budget_devops"
}

variable "user_ocid" {
  type = string
}

variable "private_key_fingerprint" {
  type = string
}

variable "private_key_path" {
  type = string
}

variable "oci_region" {
  type = string
}

variable "vcp_base_addr" {
  type        = string
  description = "The first 2 octetes of the vcn private address. ex: '192.168', 10.x. Default = '10.0'"
  default     = "10.0"
}