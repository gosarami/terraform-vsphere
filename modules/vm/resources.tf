resource "vsphere_virtual_machine" "vm" {
  name             = var.host_name
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  guest_id = var.guest_id

  num_cpus = var.num_cpus
  memory   = var.memory

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = "vmxnet3"
  }

  disk {
    label            = "disk0"
    size             = var.disk_size
    eagerly_scrub    = var.eagerly_scrub
    thin_provisioned = var.thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_content_library_item.item.id

    customize {
      linux_options {
        host_name = var.host_name
        domain    = var.domain
      }

      network_interface {
        ipv4_address = var.ipv4_address
        ipv4_netmask = var.ipv4_netmask
      }

      ipv4_gateway = var.ipv4_gateway
    }
  }
}
