terraform {
  required_version = "0.12.8"
}

provider "google" {
  version = "2.15"
  project = var.project
  region  = var.region
}


resource "google_compute_project_metadata_item" "ssh-keys" {
  key   = "ssh-keys"
  value = "appuser1:${file(var.public_key_path)} appuser2:${file(var.public_key_path)}"
}

resource "google_compute_instance" "app" {
  count = var.server_count  
  name  = "reddit-app-${count.index + 1}"
  machine_type = "g1-small"
  zone  = var.zone
  tags  = ["reddit-app"]

  boot_disk {
    initialize_params {
      image = var.disk_image
    }
  }
  
  network_interface {
    network = "default"
    access_config {}
  }

  connection {
    host        = self.network_interface[0].access_config[0].nat_ip
    type        = "ssh"
    user        = "appuser"
    agent       = false
    private_key = file(var.connection_key)
  }

  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }
}

resource "google_compute_firewall" "firewall_puma" {
  name = "allow-puma-default"
  network = "default"
  allow {
    protocol = "tcp"
    ports = ["9292"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["reddit-app"]
}
