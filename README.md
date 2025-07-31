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
| [google_compute_firewall.fw_projeto](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_instance_template.template_projeto](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance_template) | resource |
| [google_compute_network.vpc_projeto](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_region_instance_group_manager.app-server](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_group_manager) | resource |
| [google_compute_subnetwork.subnets_projeto](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_region"></a> [default\_region](#input\_default\_region) | The default region for Google Cloud resources. | `string` | `"us-central1"` | no |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The Google Cloud project ID to use for resources. | `string` | `"gcp-4linux"` | no |

## Outputs

No outputs.
