resource "null_resource" "resource-to-wait-on" {
  provisioner "local-exec" {
    command = "sleep 30"
  }
  depends_on = ["google_project_service.compute-api",
                "google_project_service.crm-api",
                "google_project_service.scheduler-api",
                "google_project_service.pubsub-api",
                "google_project_service.functions-api",
                "google_project_service.storage-api"
                ]
}

resource "google_project_service" "storage-api" {
  project = "${var.project_id}"
  service = "storage-component.googleapis.com"
  disable_dependent_services = true
  disable_on_destroy         = false
}

resource "google_project_service" "crm-api" {
  project = "${var.project_id}"
  service = "cloudresourcemanager.googleapis.com"
  disable_dependent_services = true
  disable_on_destroy         = false
}

resource "google_project_service" "compute-api" {
  project = "${var.project_id}"
  service = "compute.googleapis.com"
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

resource "google_project_service" "functions-api" {
  project = "${var.project_id}"
  service = "cloudfunctions.googleapis.com"
  disable_dependent_services = true
  disable_on_destroy         = false
}