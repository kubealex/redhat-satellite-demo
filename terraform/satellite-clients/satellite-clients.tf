module "rhel8_instance" {
  source  = "kubealex/libvirt-resources/libvirt//modules/terraform-libvirt-instance"
  instance_libvirt_pool = var.client_instance_pool_name
  instance_cloud_image = var.rhel8_instance_cloud_image
  instance_hostname = "rhel8-satellite-client"
  instance_domain = var.client_instance_domain
  instance_memory = var.client_instance_memory
  instance_cpu = var.client_instance_cpu
  instance_cloud_user = var.client_instance_cloud_user
  instance_network_interfaces = var.client_instance_network_interfaces
}

module "rhel9_instance" {
  source  = "kubealex/libvirt-resources/libvirt//modules/terraform-libvirt-instance"
  instance_libvirt_pool = var.client_instance_pool_name
  instance_cloud_image = var.rhel8_instance_cloud_image
  instance_hostname = "rhel9-satellite-client"
  instance_domain = var.client_instance_domain
  instance_memory = var.client_instance_memory
  instance_cpu = var.client_instance_cpu
  instance_cloud_user = var.client_instance_cloud_user
  instance_network_interfaces = var.client_instance_network_interfaces
}
