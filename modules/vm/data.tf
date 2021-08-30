data "vsphere_datacenter" "dc" {
  name = var.datacenter
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_content_library" "library" {
  name = var.content_library_name
}

data "vsphere_content_library_item" "item" {
  name = var.content_library_item_name
  library_id = data.vsphere_content_library.library.id
  type = var.content_library_item_type
}

