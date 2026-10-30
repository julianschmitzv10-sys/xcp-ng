# XO_vm-cluster/variables.tf

variable "node_count" {
  description = "Number of nodes"
  type        = number
}

variable "resource_set_id" {
  description = "Resource set ID (Self Service) the cluster should be assigend to."
  type        = string
  default     = null
  nullable    = true
}

variable "networks" {
  description = "Networks atteched to each node"
  type = map(object({
    network_id       = string
    expected_ip_cidr = string
  }))
}

variable "cores" {
  description = "Number of CPU cores per node"
  type        = number
}

variable "RAM_Gb" {
  description = "Gigabytes of RAM per node"
  type        = number
}

variable "node_name" {
  description = "Node name that gets indexed"
  type        = string
}

variable "template_id" {
  description = "XO template id"
  type        = string
}

variable "cloud_config_extension" {
  description = "Extends the default cluster cloud config"
  type        = string
  default     = ""
}

variable "guest-tools-iso" {
  description = "The guest tools iso used to install guest tools"
  type        = string
}

variable "storage_repositories" {
  description = "Storage repositories to use"
  type = map(object({
    sr_id      = string
    name_label = string
    size_in_Gb = number
  }))
}

variable "cluster_name" {
  description = "Name of the cluster"
  type        = string
}

variable "tags" {
  description = "Tags added to the VMs"
  type        = list(string)
  default     = []
}