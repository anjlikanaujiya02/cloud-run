variable "project_id" {
  description = "GCP Project ID"
}

variable "region" {
  default = "asia-south1"
}

variable "service_name" {
  default = "my-cloud-run-service"
}

variable "image" {
  description = "Container image URL"
}
