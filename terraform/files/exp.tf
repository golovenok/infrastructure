terraform {
  required_version = "0.13.5"
}


provider "google" {
  version = "3.0.0"
  project = var.project
  region  = var.region

}

#resource "google_compute_project_metadata" "default" {
 # metadata = {
 #   ssh-keys = "saf:${file(var.public_key_path)} appuser:${file(var.public_key_path)}"
#  }
#}


resource "google_compute_instance" "app" {
  name         = "reddit-app"
  machine_type = "e2-micro"
  zone         = var.zone
  tags         = ["reddit-app"]

  boot_disk {
    initialize_params {
      image = var.disk_image
    }
  }

  metadata = {
   ssh-keys = "saf:${file(var.public_key_path)}"
  }

  network_interface {
    network = "default"
    # использовать ephemeral IP для доступа из Интернет
    access_config {
      nat_ip = google_compute_address.app_ip.address
    }
  }

  connection {
    type        = "ssh"
    user        = "saf"
    agent       = false
    host        = google_compute_instance.app.network_interface[0].access_config[0].nat_ip
    private_key = file(var.private_key_path)
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
  # Название сети, в которой действует правило
  network = "default"
  # Какой доступ разрешить
  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }
  # Каким адресам разрешаем доступ
  source_ranges = ["0.0.0.0/0"]
  # Правило применимо для инстансов с перечисленными тэгами
  target_tags = ["reddit-app"]
}

# terraform import google_compute_firewall.firewall_ssh default-allow-ssh
resource "google_compute_firewall" "firewall_ssh" {
  description = "terraform import google_compute_firewall.firewall_ssh default-allow-ssh"
  name = "default-allow-ssh"
  network = "default"
  
  allow {
    protocol = "tcp"
    ports = ["22"]
    }

  source_ranges = ["0.0.0.0/0"]
  }

resource "google_compute_address" "app_ip" {
  name = "reddit-app-ip"
  }

