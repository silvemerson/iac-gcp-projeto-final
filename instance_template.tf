resource "google_compute_instance_template" "template_projeto" {
    for_each = google_compute_subnetwork.subnets_projeto

    name = format("%s-template-%s", terraform.workspace, each.key)
    description = "Template para criação das instâncias do projeto"

    tags = ["webapps"]

    machine_type = "e2-medium"

    disk {
        source_image = "projects/debian-cloud/global/images/family/debian-12"
        auto_delete  = true
        boot         = true
    }

    network_interface {
        subnetwork = each.value.self_link
        access_config {
            // Ephemeral IP
        }
    }
    metadata_startup_script = file("scripts/infra-final.sh")
  
}