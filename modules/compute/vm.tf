variable "vm_name" {
  }
variable "machine_type" {
  }




resource "google_compute_instance" "vm2" {
  name         = var.vm_name // "terraform-test-instance2"
  machine_type = var.machine_type //"n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "terraformsa@veerahemannthnag.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}