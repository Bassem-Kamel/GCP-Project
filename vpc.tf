resource "google_compute_network" "myvpc" {
  project = "project-ID"
  name = "myvpc"
  auto_create_subnetworks = false
  routing_mode = "REGIONAL"
}