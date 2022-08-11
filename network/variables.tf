variable "compatment_ocid" {
  type = string
}

variable "vcp_base_addr" {
  type        = string
  description = "The first 2 octetes of the vcn private address. ex: '192.168', 10.x. Default = '10.0'"
  default     = "10.0"
}