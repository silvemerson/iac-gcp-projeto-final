resource "google_compute_network" "vpc_projeto" {
    name                    = format("%s-%s", terraform.workspace, var.vpc_name)
    auto_create_subnetworks = false
  
}

resource "google_compute_subnetwork" "subnets_projeto" {
  for_each = {
    us-subnet-a    = var.subnetworks["us-subnet-a"] 
    us-subnet-b    = var.subnetworks["us-subnet-b"]
    asia-subnet-a  = var.subnetworks["asia-subnet-a"]
  }

  name          = format("%s-%s", terraform.workspace, each.value.name)
  region        = each.value.region
  ip_cidr_range = each.value.ip_cidr_range
  network       = google_compute_network.vpc_projeto.id
}


