provider "google" {
    project = "your-gcp-project-id"
    region  = "us-central1"
}

resource "google_compute_network" "vpc_network" {
    name                    = "example-vpc"
    auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnetwork" {
    name          = "example-subnetwork"
    ip_cidr_range = "10.0.0.0/16"
    region        = "us-central1"
    network       = google_compute_network.vpc_network.id
}