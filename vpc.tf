resource "google_compute_network" "vpc_projeto" {
    name                    = format("%s-vpc-projeto", terraform.workspace)
    auto_create_subnetworks = false
  
}

resource "google_compute_subnetwork" "subnets_projeto" {
  for_each = {
    us-subnet-a    = { name = "us-subnet-a", region = var.default_region, ip_cidr_range = "10.220.0.0/24" }
    us-subnet-b    = { name = "us-subnet-b", region = var.default_region, ip_cidr_range = "10.221.0.0/24" }
    asia-subnet-a  = { name = "asia-subnet-a", region = "asia-east1",     ip_cidr_range = "10.222.0.0/24" }
  }

  name          = format("%s-%s", terraform.workspace, each.value.name)
  region        = each.value.region
  ip_cidr_range = each.value.ip_cidr_range
  network       = google_compute_network.vpc_projeto.id
}


