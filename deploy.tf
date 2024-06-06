terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
    }
  }
  required_version = ">= 0.13"
}

provider "scaleway" {
    access_key = "SCWYKBZ1XFC76JD952S4"
    secret_key = "d2b2b625-2167-4393-a83a-6b8197a5f6fb"
    project_id = "c67c5f68-50b5-450f-af3b-f6bd2c353718"
    organization_id = "c67c5f68-50b5-450f-af3b-f6bd2c353718"
    region = "fr-par"
    zone = "fr-par-2"
}

resource "scaleway_instance_ip" "public_ip" {}

resource "scaleway_instance_server" "homeflix" {
    type = "PRO2-XS"
    image = "ubuntu_jammy"
    name = "homeflix"
    tags = [ "homeflix", "kubernetes" ]
    ip_id = scaleway_instance_ip.public_ip.id
    security_group_id = "fd9c6694-d012-4701-a955-e4d18ca46f72"
    root_volume {
      size_in_gb = 60
      volume_type = "b_ssd"
      delete_on_termination = true
    }
    enable_ipv6 = true
    enable_dynamic_ip = false
    routed_ip_enabled = true
    state = "started"
    boot_type = "local"
    replace_on_type_change = false
    user_data = {
      cloud-init = file("${path.module}/cloud-init.yml")
    }
}

output "instance_info" {
  value = {
    address   = scaleway_instance_server.homeflix.public_ip
    structure = scaleway_instance_server.homeflix.type
  }
}