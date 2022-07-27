resource "google_compute_router" "my-router" {
  name    = "my-router"
  project = var.net_project_id
  region  = var.net_region
  network = google_compute_network.myvpc.id
}