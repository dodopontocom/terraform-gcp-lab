resource "null_resource" "resource-to-wait-on" {
  provisioner "local-exec" {
    command = "sleep 60"
  }
  depends_on = ["google_project_service.gke-api"]
}

resource "google_project_service" "gke-api" {
  project = "gcp-laboratories"
  service = "container.googleapis.com"
  disable_dependent_services = true
  disable_on_destroy         = false
}