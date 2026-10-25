# variables.tf

variable "xo_token" {
    description = "Xen Orchestra API token"
    type = string
    sensitive = true
}

variable "xo_url" {
  description = "WebSocket URL of Xen Orchestra"
  type = string
}

variable "xo_insecure" {
  description = "Disable TLS certificate verification"
  type = bool
  default = false
}