terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = "${var.token}"
  folder_id = "${var.folder_id}"
  zone      = "${var.zone}"
  profile   = "testing"
}

resource "yandex_vpc_network" "network" {
  name = "network1"

  labels = {
    environment = "network"
  }
}

resource "yandex_vpc_subnet" "subnet" {
  name = "subnet1"
  zone = "${var.zone}"
  network_id = yandex_vpc_network.network.id
  v4_cidr_blocks = ["10.0.0.0/24"]

  labels = {
    environment = "subnet"
  }
}

resource "yandex_compute_instance" "build" {
  count = "${var.num_nodes}"
  name = "${var.instance_name}${count.index + 1}"

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat = true
  }
  resources {
    cores = "${var.cores}"
    memory = "${var.memory}"

  }
  boot_disk {
    initialize_params {
      size  = "${var.disk_size}"
      image_id="${var.image_id}"
      type = "network-ssd"
    }
  }

  metadata = {
    ssh-keys = file("~/.ssh/id_rsa.pub")
  }

  provisioner "remote-exec" {
    inline = ["echo Connected!"]

    connection {
      host = self.network_interface[0].nat_ip_address
      type = "ssh"
      user = "ubuntu"
      agent = false
      private_key = "${file(var.private_key_path)}"
    }
  }

}
