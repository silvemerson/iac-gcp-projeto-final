resource "google_compute_firewall" "fw_projeto" {
    name    = format("%s-fw-projeto", terraform.workspace)
    network = google_compute_network.vpc_projeto.self_link

    allow {
        protocol = "tcp"
        ports    = ["22", "80", "443"]
    }

    allow {
        protocol = "icmp"
    }

    source_ranges = ["0.0.0.0/0"]
  
}