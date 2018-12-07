resource "random_id" "instance_id" {
  byte_length = 6
}
resource "google_container_node_pool" "np" {
  name       = "node-pool-tf-${random_id.instance_id.hex}"
  zone       = "us-central1-a"
  cluster    = "${google_container_cluster.primary.name}"
  node_count = 3

  node_config {
    machine_type = "f1-micro"
    disk_size_gb = 10
    preemptible  = true
  }
}
resource "google_container_cluster" "primary" {
  name                = "gke-tf-${random_id.instance_id.hex}"
  zone                = "us-central1-a"
  initial_node_count  = 3
  
  addons_config {
    http_load_balancing {
      disabled = true
    }
    horizontal_pod_autoscaling {
      disabled = true
    }
  }
}
