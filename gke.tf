resource "google_container_cluster" "my-cluster" {
  project  = var.project_id 
  name     = "my-cluster"
  location = "europe-west1-b"
  network = module.network.out_vpc_name
  subnetwork = var.restricted_cidr
  remove_default_node_pool = true
  initial_node_count = 1

  ip_allocation_policy {
  }
    
 private_cluster_config {
    enable_private_endpoint = false
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "10.10.0.0/28"
  }
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = var.manage_cidr
      display_name = "management-sub"
    }
  }

  depends_on = [
    module.network
  ]
}


resource "google_container_node_pool" "node_pool1" {
  name               = "node_pool1"
  project            = var.project_id
  cluster            = google_container_cluster.my-cluster.name
  location           = google_container_cluster.my-cluster.location
  node_count = 3
  node_config {
    image_type   = "COS_CONTAINERD"
    machine_type = "e2-micro"
    service_account = google_service_account.gke-node-sa.email
  }
}