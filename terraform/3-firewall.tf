resource "google_compute_firewall" "icmp" {
  name                  = "allow-icmp"
  description           = "allow-icmp"
  project               = local.project
  network               = module.vpc.network_name
  priority              = 1000
  direction             = "INGRESS"

  allow {
    protocol    = "icmp"
  }
  log_config {
              metadata = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_firewall" "ssh" {
  name                  = "allow-ssh"
  description           = "allow-ssh"
  project               = local.project
  network               = module.vpc.network_name
  priority              = 1000
  direction             = "INGRESS"

  allow {
    protocol    = "tcp"
    ports       = ["22"]
  }
  log_config {
              metadata = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_firewall" "http-https" {
  name                  = "allow-http-https"
  description           = "allow-http-https"
  project               = local.project
  network               = module.vpc.network_name
  priority              = 1000
  direction             = "INGRESS"

  allow {
    protocol    = "tcp"
    ports       = ["80","443"]
  }
  log_config {
              metadata = "INCLUDE_ALL_METADATA"
  }
}