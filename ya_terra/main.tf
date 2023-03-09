terraform {
  required_version = "1.3.9"
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.85.0"
    }
  }

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "start"
    region     = "ru-central1"
    key        = "bucket/terraform.tfstate"
    access_key = "README.md"
    secret_key = "README.md"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

provider "yandex" {
  service_account_key_file = file("README.md")
  cloud_id                 = "README.md"
  folder_id                = "README.md"
}

resource "yandex_vpc_network" "terra" {
  name = "terranet"
}

resource "yandex_vpc_subnet" "subterra1" {
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.terra.id
  v4_cidr_blocks = ["192.168.10.0/24"]
  name           = "subterra1"
}

data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2004-lts"
}

resource "yandex_compute_instance" "vm_1" {
  name = "vm-1"
  zone = "ru-central1-a"

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = 20
      type     = "network-hdd"
  }
}

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subterra1.id
    nat       = true
  }

  metadata = {
    user-data = "${file("README.md")}"
  }
}
