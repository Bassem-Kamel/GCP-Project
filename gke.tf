resource "google_container_cluster" "my-cluster1" {
  project                  = var.project_id
  name                     = "my-cluster1"
  location                 = "europe-west1-b" #The location (region or zone) in which the cluster master will be created.
  network                  = module.network.out_vpc_name
  subnetwork               = module.network.out_restricted-sub_name
  remove_default_node_pool = true
  initial_node_count       = 1 #The number of nodes to create in this cluster's default node pool
  #if you're using google_container_node_pool objects with no default node pool, you'll need to set this to a value of at least 1,
  #alongside setting remove_default_node_pool to true.
  default_max_pods_per_node = 10 #he default maximum number of pods per node in this cluster


  ip_allocation_policy {
    #Configuration of cluster IP allocation for VPC-native clusters. 
    #Adding this block enables IP aliasing, making the cluster VPC-native instead of routes-based.
  }

  private_cluster_config {                   #  Configuration for private clusters, clusters with private nodes
    enable_private_endpoint = true           #the cluster's private endpoint is used as the cluster endpoint
    enable_private_nodes    = true           #Enables the private cluster feature, creating a private endpoint on the cluster.
    master_ipv4_cidr_block  = "10.10.0.0/28" #The IP range in CIDR notation to use for the hosted master network. This range will be used for assigning private IP addresses to the cluster master
  }
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = var.manage_cidr #external networks that can access the Kubernetes cluster master through HTTPS
      display_name = "management-sub"
    }
  }

  depends_on = [
    module.network
  ]
}


resource "google_container_node_pool" "node-pool1" {
  name       = "node-pool1"
  project    = var.project_id
  cluster    = google_container_cluster.my-cluster1.name     #The cluster to create the node pool for.
  location   = google_container_cluster.my-cluster1.location #The location (region or zone) of the cluster.
  node_count = 3                                             #The number of nodes per instance group
  node_config {                                              #Parameters used in creating the node pool
    image_type      = "COS_CONTAINERD"
    machine_type    = "e2-micro"
    service_account = google_service_account.gke-node-sa.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}