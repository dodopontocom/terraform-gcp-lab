resource "null_resource" "resource-to-wait-on" {
  provisioner "local-exec" {
    command = "sleep 90"
  }
  depends_on = ["google_project_service.gke-api"]
}

resource "google_project_service" "crm-api" {
  project = "${var.project_id}"
  service = "cloudresourcemanager.googleapis.com"
  disable_dependent_services = true
  disable_on_destroy         = false
}

resource "google_project_service" "gke-api" {
  project = "${var.project_id}"
  service = "container.googleapis.com"
  disable_dependent_services = true
  disable_on_destroy         = false
}

resource "google_project_service" "scheduler-api" {
  project = "${var.project_id}"
  service = "cloudscheduler.googleapis.com"
  disable_dependent_services = true
  disable_on_destroy         = false
}

resource "google_project_service" "pubsub-api" {
  project = "${var.project_id}"
  service = "pubsub.googleapis.com"
  disable_dependent_services = true
  disable_on_destroy         = false
}