provider "google" {
  credentials = "${file("/root/terraform-gcp-lab/.credentials/credential.json")}"
  project     = "${var.project_id}"
  region      = "${var.region}"
}