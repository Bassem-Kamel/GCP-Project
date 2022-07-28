
resource "google_compute_firewall" "allow_iap" {
  project       = var.project_id
  name          = "allow-iap"
  network       = var.vpc_name
  direction     = "INGRESS"
  source_ranges = ["35.235.240.0/20"] # IAP CIDR
  #the firewall will apply only to traffic that has source IP address in these ranges

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  depends_on = [
    module.network
  ]

}