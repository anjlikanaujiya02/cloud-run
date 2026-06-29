provider "google" {
  project = var.project_id
  region  = var.region
}

# Cloud Run Service
resource "google_cloud_run_service" "app" {
  name     = var.service_name
  location = var.region

  template {
    spec {
      containers {
        image = var.image

        ports {
          container_port = 8080
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

# Make it public
resource "google_cloud_run_service_iam_member" "public_access" {
  location = var.region
  project  = var.project_id
  service  = google_cloud_run_service.app.name

  role   = "roles/run.invoker"
  member = "allUsers"
}
