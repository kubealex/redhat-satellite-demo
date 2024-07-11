variable "client_instance_network_interfaces" {
  description = "A list of network interfaces to add to the instance"
  type = list(object({
    interface_network       = string
    interface_mac_address   = optional(string)
    interface_addresses     = optional(list(string), [])
    interface_hostname      = optional(string)
    interface_wait_for_lease = optional(bool, true)
  }))
  default = [{
    interface_network = "demo"
  }]
}

variable "client_instance_pool_name" {
  description = "Name of the libvirt pool"
  type        = string
  default     = "demo"
}

variable "client_instance_cloud_user" {
  description = "Cloud user for the instance"
  type = object({
    username = string
    password = string
    sshkey   = optional(string)
  })
  default = {
    username = "sysadmin"
    password = "$6$rounds=4096$81l4sZd3qjK9Sf8h$0aF.q8JDn98uw2SZLk58rm7gOA2HwgWmy/2ZlT3pJNU2PDAxzT5wS3uF3WlvSLvlnyrg2EtybwUtJytez3VEw0"
    sshkey   = ""
  }
}

variable "client_instance_domain" {
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

variable "client_instance_cpu" {
  description = "Number of CPUs to configure for the instance"
  type        = number
  default     = 1
}

variable "client_instance_memory" {
  description = "Instance memory size, in GB"
  type        = number
  default     = 2
}

