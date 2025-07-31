resource "google_compute_network" "vpc_projeto" {
    name                    = format("%s-vpc-projeto", terraform.workspace)
    auto_create_subnetworks = false
  
}

resource "google_compute_subnetwork" "subnet-us-central1-a" {
    name          = format("%s-subnet-us-central1-a", terraform.workspace)
    ip_cidr_range = "10.220.0.0/24"
    region        = var.default_region
    network       = google_compute_network.vpc_projeto.id
}

resource "google_compute_subnetwork" "subnet-us-central1-b" {
    name          = format("%s-subnet-us-central1-b", terraform.workspace)
    ip_cidr_range = "10.221.0.0/24"
    region        = var.default_region
    network       = google_compute_network.vpc_projeto.id
  
}

resource "google_compute_subnetwork" "asia-east1-a" {
    name          = format("%s-subnet-asia-east1-a", terraform.workspace)
    ip_cidr_range = "10.222.0.0/24"
    region        = "asia-east1"
    network       = google_compute_network.vpc_projeto.id
}