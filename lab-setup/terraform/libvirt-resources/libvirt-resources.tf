module "libvirt_pool" {
  source     = "kubealex/libvirt-resources/libvirt//modules/terraform-libvirt-pool"
  pool_name  = var.pool_name
}

module "libvirt_network" {
  source                  = "kubealex/libvirt-resources/libvirt//modules/terraform-libvirt-network"
  network_name            = var.network_name
  network_domain          = var.network_domain
  network_cidr            = var.network_cidr
  network_dhcp_enabled    = var.network_dhcp_enabled
  network_dns_enabled     = var.network_dns_enabled
  network_dns_local       = var.network_dns_local
  network_dnsmasq_options = var.network_dnsmasq_options
}
