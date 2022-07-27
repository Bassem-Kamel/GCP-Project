resource "google_compute_subnetwork" "mangement-sub" {
  name          = "mangement-sub"
  ip_cidr_range = var.net_manage_cidr
  region        = var.net_region
  network       = google_compute_network.myvpc.id
}


resource "google_compute_subnetwork" "restreicted-sub" {
  name          = "restreicted-sub"
  ip_cidr_range = var.net_restricted_cidr
  region        = var.net_region
  network       = google_compute_network.myvpc.id
}