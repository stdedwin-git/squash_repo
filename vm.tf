provider "google" {
    project = var.project_id
    region  = var.region
    zone    = var.zone
}

resource "google_compute_instance" "vm_instance" {
    name         = var.instance_name
    machine_type = var.machine_type
    zone         = var.zone

    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-11"
        }
    }

    network_interface {
        network = "default"

        access_config {
        }
    }

    tags = ["http-server", "https-server"]

    metadata = {
        ssh-keys = "your-username:ssh-rsa your-ssh-key"
    }
}
resource "google_compute_instance" "ubuntu_vm_instance" {
    name         = "ubuntu-vm"
    machine_type = var.machine_type
    zone         = var.zone

    boot_disk {
        initialize_params {
            image = "ubuntu-os-cloud/ubuntu-2004-lts"
        }
    }

    network_interface {
        network = "default"

        access_config {
        }
    }

    tags = ["http-server", "https-server"]

    metadata = {
        ssh-keys = "your-username:ssh-rsa your-ssh-key"
    }
}