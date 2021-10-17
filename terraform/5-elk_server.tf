resource "google_compute_instance" "vm_elk_server" {
  name                            = "svelk01"
  machine_type                    = "e2-medium"
  zone                            = local.zone

  boot_disk {
    device_name                   = "svelk01"
    initialize_params {
      image                       = "ubuntu-os-cloud/ubuntu-1804-lts"
      size                        = 50
      type                        = "pd-balanced"
    }
  }

  network_interface {
    network                       = "core-network"
    subnetwork                    = "core-sub-europe-west1"
    network_ip                    = "10.1.0.15"
    access_config {
        nat_ip                    = PUBLIC.IP
        network_tier              = "PREMIUM"
    }
  }

  service_account {
    email                         = local.mail_account
    scopes                        = ["cloud-platform"]
  }

  scheduling {
    on_host_maintenance           = "MIGRATE"
    automatic_restart             = "true"
    preemptible                   = "false"
  }

  shielded_instance_config {
    enable_integrity_monitoring   = "true"
    enable_vtpm                   = "true"
    enable_secure_boot            = "false"
  }
}
