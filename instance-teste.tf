resource "google_compute_instance" "teste" {
    name         = "instance-teste"
    machine_type = var.machine_type
    zone         = "us-central1-a"
    
    boot_disk {
        initialize_params {
        image = "debian-cloud/debian-11"
        }
    }
    
    network_interface {
        network    = "default"
        access_config {}
    }
    
    metadata_startup_script = file("scripts/infra-final.sh")

}

resource "google_compute_firewall" "teste" {
    name    = "teste-firewall"
    network = "default"

    allow {
        protocol = "tcp"
        ports    = ["80", "443", "22"]
    }

    source_ranges = ["0.0.0.0/0"]
}