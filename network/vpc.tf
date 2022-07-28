resource "google_compute_network" "myvpc" {
  project = var.net_project_id
  name = var.net_vpc_name
  auto_create_subnetworks = false #True to make GCP create a subnet in every region (34 subnets) or make it false.
  routing_mode = "REGIONAL"  #set to REGIONAL, this network's cloud routers will only advertise routes with subnetworks of this network in the same region as the router
}