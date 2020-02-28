provider "google" {
  credentials = "${file(var.key)}"
  project     = var.project_id
  region      = var.region
}
