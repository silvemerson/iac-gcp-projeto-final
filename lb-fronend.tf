resource "google_compute_global_forwarding_rule" "global_projeto" {
    name = format("%s-%s", terraform.workspace, "global-projeto")
    target = google_compute_target_http_proxy.target_projeto.id
    port_range = "80"
  
}

resource "google_compute_target_http_proxy" "target_projeto" {
    name = format("%s-%s", terraform.workspace, "target-projeto")
    url_map = google_compute_url_map.url_map_projeto.self_link
  
}

resource "google_compute_url_map" "url_map_projeto" {
    name = format("%s-%s", terraform.workspace, "url-map-projeto")
    default_service = google_compute_backend_service.backend_projeto.id
  
}