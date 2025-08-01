variable "gcp_project_id" {
    description = "The Google Cloud project ID to use for resources."
    type        = string
    default = "gcp-4linux"
  
}

variable "default_region" {
    description = "The default region for Google Cloud resources."
    type        = string
    default = "us-central1"
  
}

variable "fw_name" {
    description = "The name of the firewall rule."
    type        = string
    default     = "fw-projeto"
  
}

variable "allow_rules" {
    description = "Regras de permissão para o firewall"
    type = list(string)
    default = ["22", "80", "443"]
  
}

variable "vpc_name" {
    description = "The name of the VPC network."
    type        = string
    default     = "vpc-projeto"
  
}

variable "subnetworks" {
    description = "Map of subnetwork configurations."
    type = map(object({
        name          = string
        region        = string
        ip_cidr_range = string
    }))
    default = {
        "us-subnet-a"   = { name = "us-subnet-a", region = "us-central1", ip_cidr_range = "10.220.0.0/24"}
        "us-subnet-b"   = { name = "us-subnet-b", region = "us-central1", ip_cidr_range = "10.221.0.0/24"}
        "asia-subnet-a" = { name = "asia-subnet-a", region = "asia-east1", ip_cidr_range = "10.222.0.0/24"}
    }
}

variable "template_name" {
    description = "The name of the instance template."
    type        = string
    default     = "template"
  
}

variable "machine_type" {
    description = "The machine type for the instance template."
    type        = string
    default     = "e2-medium"
  
}

variable "source_image" {
    description = "The source image for the instance template."
    type        = string
    default     = "projects/debian-cloud/global/images/family/debian-12"
  
}

# variable "workspace" {
#     description = "The name of the Terraform workspace."
#     type        = string
  
# }

variable "health_check_name" {
    description = "The name of the HTTP health check."
    type        = string
    default     = "http-health-check-projeto"
  
}

variable "health_request_path" {
    description = "The request path for the health check."
    type        = string
    default     = "/"
  
}

variable "health_timeout_sec" {
    description = "The timeout in seconds for the health check."
    type        = number
    default     = 1
  
}

variable "health_check_interval_sec" {
    description = "The interval in seconds between health checks."
    type        = number
    default     = 1
  
}