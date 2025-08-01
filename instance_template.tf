resource "google_compute_instance_template" "template_projeto" {
    for_each = google_compute_subnetwork.subnets_projeto

    name = format("%s-%s-%s", terraform.workspace, var.template_name, each.key)
    description = "Template para criação das instâncias do projeto"

    tags = ["webapps"]

    machine_type = var.machine_type

    disk {
        source_image = var.source_image
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