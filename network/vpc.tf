resource "google_compute_network" "myvpc" {
  project = var.net_project_id
  name = var.net_vpc_name
  auto_create_subnetworks = false
  routing_mode = "REGIONAL"
}