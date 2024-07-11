provider "libvirt" {
  uri = "qemu:///system"
}

module "libvirt_resources" {
  source = "./libvirt-resources"
  network_domain          = var.network_domain
  network_cidr            = var.network_cidr    
  network_dnsmasq_options = var.network_dnsmasq_options
}

module "satellite_instances" {
  source  = "./satellite"
  depends_on = [ module.libvirt_resources ]
  satellite_instance_cloud_image = var.satellite_instance_cloud_image
  satellite_instance_domain = var.network_domain
}


module "satellite_clients" {
  source  = "./satellite-clients"
  depends_on = [ module.libvirt_resources ]
  rhel8_instance_cloud_image = var.rhel8_instance_cloud_image
  rhel9_instance_cloud_image = var.rhel9_instance_cloud_image  
  client_instance_domain = var.network_domain
}

terraform {
 required_version = ">= 1.0"
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.7.6"
    }
  }
}
