module "satellite_instance" {
  source  = "kubealex/libvirt-resources/libvirt//modules/terraform-libvirt-instance"
  instance_network_interfaces = var.satellite_instance_network_interfaces
  instance_libvirt_pool =       var.satellite_instance_pool_name
  instance_cloud_image =        var.satellite_instance_cloud_image
  instance_hostname =           var.satellite_instance_hostname
  instance_domain =             var.satellite_instance_domain
  instance_volume_size =        var.satellite_instance_volume_size
  instance_memory =             var.satellite_instance_memory
  instance_cpu =                var.satellite_instance_cpu
  instance_cloud_user =         var.satellite_instance_cloud_user
}
