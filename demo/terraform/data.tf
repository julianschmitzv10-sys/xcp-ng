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

data "xenorchestra_vdi" "guest-tools-iso" {
    # name_label = "guest-tools.iso"
    id = "73b8c062-fe4a-4dc0-a148-e5062e1efdce"
}

