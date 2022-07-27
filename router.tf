resource "google_compute_router" "router" {
  name    = "my-router"
  region  = google_compute_subnetwork.sub.region
  network = google_compute_network.vpc_network.id
  project = project_name
}