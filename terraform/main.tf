provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_compute_network" "vpc_network" {
  name = "my-vpc-network"
}

resource "google_compute_subnetwork" "public_subnet" {
  name          = "my-public-subnet"
  network       = google_compute_network.vpc_network.id
  ip_cidr_range  = "10.0.1.0/24"
  region         = var.region
}

resource "google_compute_subnetwork" "private_subnet" {
  name          = "my-private-subnet"
  network       = google_compute_network.vpc_network.id
  ip_cidr_range  = "10.0.2.0/24"
  region         = var.region
}

resource "google_compute_instance" "web_instance" {
  name         = "web-instance"
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11-bullseye-v20230816"
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.id
    subnetwork = google_compute_subnetwork.public_subnet.id

    access_config {
      // Include this to get a public IP
    }
  }

  metadata_startup_script = file("startup-script.sh")
}

resource "google_compute_firewall" "default" {
  name    = "default-firewall"
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}
