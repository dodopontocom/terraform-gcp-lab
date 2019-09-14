resource "google_project_services" "project" {
 project = "${var.project_id}"
 services = [
   "compute.googleapis.com"
 ]
}