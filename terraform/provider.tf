provider "google" {
  credentials = "${file("/root/terraform-gcp-lab/.credentials/credential.jsona")}"
  project     = "${var.project_id}"
  region      = "${var.region}"
}