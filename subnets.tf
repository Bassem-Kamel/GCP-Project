resource "google_compute_subnetwork" "sub1" {
  name          = sub1_name
  ip_cidr_range = sub1_cidr
  region        = region
  network       = google_compute_network.vpc_network.id
  private_ip_google_access = true
}