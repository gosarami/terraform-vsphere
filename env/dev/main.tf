variable "vsphere_user" {}
variable "vsphere_password" {}
variable "vsphere_server" {}

provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  allow_unverified_ssl = true
}

module "ubuntu_sandbox" {
  source = "../../modules/vm"
  host_name = "ubuntu-sandbox"
  domain = "example.com"
  datacenter = "Gosarami-Datacenter"
  cluster = "Gosarami-Cluster-1"
  datastore = "ssd-2.5-sandisk"
  network = "VLAN_10"
  content_library_name = "Basic"
  content_library_item_name = "ubuntu-20.04.1"
  content_library_item_type = "OVF"
  guest_id = "ubuntu64Guest"
  num_cpus = 2
  memory = 1024
  disk_size = 20
  eagerly_scrub = false
  thin_provisioned = false
  ipv4_address = "10.0.10.11"
  ipv4_netmask = 24
  ipv4_gateway = "10.0.10.254"
}
