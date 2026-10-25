# data.tf

data "xenorchestra_template" "template" {
  name_label = "Ubuntu-26.04.1_clone-template"
}

data "terraform_remote_state" "bootstrap" {
    backend = "local"

    config = {
        path = "${path.module}/../../bootstrap/terraform/terraform.tfstate"
    }
}