resource "google_compute_router_nat" "nat" {
  name                               = "my-router-nat"
  router                             = google_compute_router.my-router.name
  region                             = google_compute_router.my-router.region
  nat_ip_allocate_option             = "AUTO_ONLY" #for only allowing NAT IPs allocated by Google Cloud Platform.
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS" #A list of Subnetworks are allowed to Nat (specified in the field subnetwork below)

  subnetwork {
    name                    = google_compute_subnetwork.mangement-sub.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}