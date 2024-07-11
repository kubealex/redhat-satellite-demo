variable "pool_name" {
  description = "Name of the libvirt storage pool"
  type        = string
  default     = "demo"
}

variable "network_name" {
  description = "Name of the libvirt network"
  type        = string
  default     = "demo"
}

variable "network_domain" {
  description = "Domain for the libvirt network"
  type        = string
  default     = "demo.labs"
}

variable "network_cidr" {
  description = "CIDR block for the libvirt network"
  type        = list(string)
  default     = ["192.168.230.0/24"]
}

variable "network_dhcp_enabled" {
  description = "Enable DHCP for the libvirt network"
  type        = bool
  default     = true
}

variable "network_dns_enabled" {
  description = "Enable DNS for the libvirt network"
  type        = bool
  default     = true
}

variable "network_dns_local" {
  description = "Enable local DNS for the libvirt network"
  type        = bool
  default     = true
}

variable "network_dnsmasq_options" {
  description = "DNSMasq options for the libvirt network"
  type        = map(string)
  default     = {
    "server" = "/demo.labs/192.168.230.1"
  }
}

