resource "google_project_services" "project" {
 project = "${google_project.project.project_id}"
 services = [
   "compute.googleapis.com"
 ]
}