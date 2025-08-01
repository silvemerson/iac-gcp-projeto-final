# Infra as Code - Projeto Final GCP

Esse projeto vai contemplar um conjuto de recursos na GCP, que serão criados via Terraform. 

Teremos um balanceador de cargas que irá atender todas as requisições em um IP único. Essas requisições serão enviadas para um conjunto de máquinas nos Estados Unidos (em duas
zonas distintas), ou, para um região da Ásia (apenas uma zona), isso vai depender de onde o usuário estiver fazendo as requisições e com base nisso o usuário será direcionado para a região mais perto (Estados Unidos ou Ásia) da sua localização física. Em caso de uma região inteira acabar ficando offline, o tráfego será enviado automaticamente para outra região


Módulos necessários (Pode haver variações)

- firewall
- health-check
- instance
- instance-groups
- instance-templates
- load-balancer
- load-balancer-backend
- load-balancer-frontend
- load-balancer-target-http-proxy
- network
- router
- router-nat
- subnetwork
- tcp-health-check

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 6.46.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_backend_service.backend_projeto](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_backend_service) | resource |
| [google_compute_firewall.fw_projeto](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_global_forwarding_rule.global_projeto](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_forwarding_rule) | resource |
| [google_compute_http_health_check.health_projeto](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_http_health_check) | resource |
| [google_compute_instance_template.template_projeto](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance_template) | resource |
| [google_compute_network.vpc_projeto](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_region_instance_group_manager.app-server](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_group_manager) | resource |
| [google_compute_subnetwork.subnets_projeto](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_compute_target_http_proxy.target_projeto](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_http_proxy) | resource |
| [google_compute_url_map.url_map_projeto](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_url_map) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_rules"></a> [allow\_rules](#input\_allow\_rules) | Regras de permissão para o firewall | `list(string)` | <pre>[<br/>  "22",<br/>  "80",<br/>  "443"<br/>]</pre> | no |
| <a name="input_default_region"></a> [default\_region](#input\_default\_region) | The default region for Google Cloud resources. | `string` | `"us-central1"` | no |
| <a name="input_fw_name"></a> [fw\_name](#input\_fw\_name) | The name of the firewall rule. | `string` | `"fw-projeto"` | no |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The Google Cloud project ID to use for resources. | `string` | `"gcp-4linux"` | no |
| <a name="input_health_check_interval_sec"></a> [health\_check\_interval\_sec](#input\_health\_check\_interval\_sec) | The interval in seconds between health checks. | `number` | `1` | no |
| <a name="input_health_check_name"></a> [health\_check\_name](#input\_health\_check\_name) | The name of the HTTP health check. | `string` | `"http-health-check-projeto"` | no |
| <a name="input_health_request_path"></a> [health\_request\_path](#input\_health\_request\_path) | The request path for the health check. | `string` | `"/"` | no |
| <a name="input_health_timeout_sec"></a> [health\_timeout\_sec](#input\_health\_timeout\_sec) | The timeout in seconds for the health check. | `number` | `1` | no |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | The machine type for the instance template. | `string` | `"e2-medium"` | no |
| <a name="input_source_image"></a> [source\_image](#input\_source\_image) | The source image for the instance template. | `string` | `"projects/debian-cloud/global/images/family/debian-12"` | no |
| <a name="input_subnetworks"></a> [subnetworks](#input\_subnetworks) | Map of subnetwork configurations. | <pre>map(object({<br/>        name          = string<br/>        region        = string<br/>        ip_cidr_range = string<br/>    }))</pre> | <pre>{<br/>  "asia-subnet-a": {<br/>    "ip_cidr_range": "10.222.0.0/24",<br/>    "name": "asia-subnet-a",<br/>    "region": "asia-east1"<br/>  },<br/>  "us-subnet-a": {<br/>    "ip_cidr_range": "10.220.0.0/24",<br/>    "name": "us-subnet-a",<br/>    "region": "us-central1"<br/>  },<br/>  "us-subnet-b": {<br/>    "ip_cidr_range": "10.221.0.0/24",<br/>    "name": "us-subnet-b",<br/>    "region": "us-central1"<br/>  }<br/>}</pre> | no |
| <a name="input_template_name"></a> [template\_name](#input\_template\_name) | The name of the instance template. | `string` | `"template"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | The name of the VPC network. | `string` | `"vpc-projeto"` | no |

## Outputs

No outputs.
