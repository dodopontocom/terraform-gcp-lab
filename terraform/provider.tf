provider "google" {
  credentials = "${file(${var.service_account_credential_path})}"
  project     = "${var.project_id}"
  region      = "${var.region}"
}