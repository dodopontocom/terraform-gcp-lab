resource "google_container_cluster" "primary" {
  name         = "gke-tf-${random_id.instance_id.hex}"
  //machine_type = "f1-micro"
  zone         = "us-central1-a"
  initial_node_count = 3

  addons_config {
    http_load_balancing {
      disabled = true
    }
    horizontal_pod_autoscaling {
      disabled = true
    }
  }
}