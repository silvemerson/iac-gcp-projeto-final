resource "google_compute_firewall" "fw_projeto" {
    name    = format("%s-%s", terraform.workspace, var.fw_name)
    network = google_compute_network.vpc_projeto.self_link

    allow {
        protocol = "tcp"
        ports    = var.allow_rules
    }

    allow {
        protocol = "icmp"
    }

    source_ranges = ["0.0.0.0/0"]
  
}