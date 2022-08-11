locals {
  # Based in http://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml
  protocols_numbers = {
    "TCP"  = 6,
    "UDP"  = 17,
    "ICMP" = 1
  }
  protocols_ports = {
    "HTTP"  = 80,
    "HTTPS" = 443,
    "SSH"   = 22
  }
  cidr_blocks = {
    "EVERYONE"   = "0.0.0.0/0",
    "PUBLIC"     = "${var.vcp_base_addr}.0.0/24",
    "PRIVATE"    = "${var.vcp_base_addr}.10.0/24",
    "MANAGEMENT" = "${var.vcp_base_addr}.20.0/24",
    "VCP"        = "${var.vcp_base_addr}.0.0/16"
  }
}

# public subnet allow inbound trafick from 80 and 443 ports to the internet
resource "oci_core_security_list" "public_security_list" {
  compartment_id = var.compatment_ocid
  vcn_id         = oci_core_vcn.main_vcn.id

  ingress_security_rules {
    protocol = local.protocols_numbers["TCP"]
    source   = local.cidr_blocks["EVERYONE"]

    #Optional
    description = "Allow inbound for HTTP"
    stateless   = false
    tcp_options {

      #Optional
      max = local.protocols_ports["HTTP"]
      min = local.protocols_ports["HTTP"]
    }
  }

  ingress_security_rules {
    protocol = local.protocols_numbers["TCP"]
    source   = local.cidr_blocks["EVERYONE"]

    #Optional
    description = "Allow inbound for HTTPS"
    stateless   = false
    tcp_options {

      #Optional
      max = local.protocols_ports["HTTPS"]
      min = local.protocols_ports["HTTPS"]
    }
  }

  egress_security_rules {
    #Required
    destination = local.cidr_blocks["EVERYONE"]
    protocol    = local.protocols_numbers["TCP"]

    #Optional
    description = "Allow HTTP outbound"
    stateless   = false
    tcp_options {

      #Optional
      max = local.protocols_ports["HTTP"]
      min = local.protocols_ports["HTTP"]
    }
  }

  egress_security_rules {
    #Required
    destination = local.cidr_blocks["EVERYONE"]
    protocol    = local.protocols_numbers["TCP"]

    #Optional
    description = "Allow HTTPS outbound"
    stateless   = false
    tcp_options {

      #Optional
      max = local.protocols_ports["HTTPS"]
      min = local.protocols_ports["HTTPS"]
    }
  }
}
