resource "google_compute_http_health_check" "health_projeto" {
    name = format("%s-%s", terraform.workspace, var.health_check_name)
    request_path = var.health_request_path
    timeout_sec = var.health_timeout_sec
    check_interval_sec = var.health_check_interval_sec
}

resource "google_compute_backend_service" "backend_projeto" {
    name = format("%s-%s", terraform.workspace, "backend")
    port_name = "http"
    protocol = "HTTP"
    timeout_sec = 10

    dynamic "backend" {
        for_each = google_compute_region_instance_group_manager.app-server
        content {
            group = backend.value.instance_group
            balancing_mode = "UTILIZATION"
            max_utilization = 0.8
        }
      
    }


    health_checks = [ google_compute_http_health_check.health_projeto.id ]

}
