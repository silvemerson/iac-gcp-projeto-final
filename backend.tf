terraform {
  backend "gcs" {
    bucket = "tfstate-projeto-curso"
    prefix = "terraform/state"
  }
}