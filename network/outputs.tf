output "out_vpc_name" {
    value = google_compute_network.myvpc.name
  
}
output "out_mangement-sub_name" {
  value = google_compute_subnetwork.mangement-sub.name
}

output "out_restricted-sub_name" {
  value = google_compute_subnetwork.restricted-sub.name
}