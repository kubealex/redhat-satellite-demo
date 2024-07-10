variable "satellite_instance_cloud_image" {
    description = "Cloud image to use for instance provisioning"
    type        = string
}

variable "satellite_instance_domain" {
  description = "Domain for the instance"
  type        = string
  default     = "demo.labs"
}

variable "rhel8_instance_cloud_image" {
  description = "Cloud image to use for instance provisioning"
  type        = string
}

variable "rhel9_instance_cloud_image" {
  description = "Cloud image to use for instance provisioning"
  type        = string
}

variable "network_domain" {
  description = "Domain for the libvirt network"
  type        = string
  default     = "demo.labs"
}

variable "network_cidr" {
  description = "CIDR block for the libvirt network"
  type        = list(string)
  default     = ["192.168.254.0/24"]
}

variable "network_dnsmasq_options" {
  description = "DNSMasq options for the libvirt network"
  type        = map(string)
  default     = {
    "server" = "/demo.labs/192.168.230.1"
  }
}
