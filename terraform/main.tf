provider "google" {
  project = "sisdis-project-419008"
  region = "us-central1"
  zone = "us-central1-a"
}

locals {
  startup_script_path = "./init.sh"
  startup_script_content = file(local.startup_script_path)
}

resource "google_compute_firewall" "allow-ethereum-traffic" {
  name    = "allow-ethereum"
  network = "default"

  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["8545", "30303"]
  }

  source_tags = ["dchain-mimic-node"]
}

resource "google_compute_instance" "node_instance" {
  boot_disk {
    auto_delete = true
    device_name = "node-instance"
    
    initialize_params {
      image = "https://www.googleapis.com/compute/beta/projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20240307b"
      size  = 20
      type  = "pd-standard"
    }
    mode   = "READ_WRITE"
  }
  
  labels = {
    goog-ops-agent-policy = "v2-x86-template-1-2-0"
  }
  
  name = "node-instance"
  machine_type = "e2-medium"
  tags = ["dchain-mimic-node"]
  
  metadata = {
    enable-osconfig = "TRUE"
    startup-script = local.startup_script_content
  }

  reservation_affinity {
    type = "ANY_RESERVATION"
  }
  
  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    provisioning_model  = "STANDARD"
  }
  
  network_interface {
    network = "default"
    access_config {}
  }
}
