provider "google" {
  credentials = "${file("account.json")}"
  project     = "talk-uniso-02"
  region      = "us-central1-a"
}
