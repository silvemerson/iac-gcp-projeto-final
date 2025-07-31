locals {
  instance_groups = {
    us-a = {
        name = format("%s-us-a-instance-group", terraform.workspace)
        region = var.default_region
        zones = ["us-central1-a"]
        template_key = "us-subnet-a"
        size = 1
    },
    us-b = {
        name = format("%s-us-b-instance-group", terraform.workspace)
        region = var.default_region
        zones = ["us-central1-b"]
        template_key = "us-subnet-b"
        size = 1
    },
    asia = {
        name = format("%s-asia-a-instance-group", terraform.workspace)
        region = "asia-east1"
        zones = ["asia-east1-a"]
        template_key = "asia-subnet-a"
        size = 1
    }
  }
}

resource "google_compute_region_instance_group_manager" "app-server" {
  for_each = local.instance_groups

  name                    = each.value.name
  base_instance_name      = "webapp"
  region                  = each.value.region
  distribution_policy_zones = each.value.zones

  version {
    instance_template = google_compute_instance_template.template_projeto[each.value.template_key].self_link
  }

  target_size = each.value.size
  
}
