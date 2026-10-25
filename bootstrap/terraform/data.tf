# data.tf

data "xenorchestra_pool" "pool" {
  name_label = "xcpng-host-testing-1"
}


data "xenorchestra_sr" "local_storage" {
  name_label = "vm-pool-sr-1"
  pool_id = data.xenorchestra_pool.pool.id
}

data "xenorchestra_sr" "iso_storage" {
  name_label = "iso-pool"
  pool_id = data.xenorchestra_pool.pool.id
}


data "xenorchestra_template" "template" {
  name_label = "Ubuntu Noble Numbat 24.04"
}

data "xenorchestra_template" "ubuntu-26-04-1" {
  name_label = "Ubuntu-26.04.1_clone-template"
}

data "xenorchestra_vdi" "ubuntu-iso" {
    # id = "0ab9f7ac-4cc3-430f-978b-e493016814f0"
    pool_id = data.xenorchestra_pool.pool.id
    name_label = "ubuntu-26.04.1-live-server-amd64.iso"
}