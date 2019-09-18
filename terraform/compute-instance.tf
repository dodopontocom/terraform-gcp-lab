resource "random_id" "instance_id" {
  byte_length = 4
}
resource "google_compute_address" "static_ip_address" {
  name = "static-ip-address"
}
resource "google_compute_instance" "gcp_lab_instance" {
  name         = "vm-tf-${random_id.instance_id.hex}"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"

  labels       = {
    "env" = "${var.compute_instance_environment}"
  }
  
  boot_disk {
    initialize_params {
      image = "${var.ubuntu_image}"
    }
  }
  
  allow_stopping_for_update = true
  
  metadata_startup_script = "${file("${var.startup_script}")}"

  network_interface {
    network = "default"

    access_config {
      // Include this section to give the VM an external ip address
      nat_ip = "${google_compute_address.static_ip_address.address}"
    }
  }

  // Apply the firewall rule to allow external IPs to access this instance
  tags = ["http-server", "https-server"]
}
resource "google_compute_firewall" "http-server" {
  name    = "default-allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", 8080]
  }

  // Allow traffic from everywhere to instances with an http-server tag
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server", "https-server"]
}

output "ip" {
  value = "${google_compute_instance.gcp_lab_instance.network_interface.0.access_config.0.nat_ip}"
}
