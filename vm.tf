resource "google_compute_instance" "bastion-vm" {
  name         = "bastion-vm"
  project      = "pythonapp-project"
  machine_type = var.vm_type
  zone         = var.vm_zone
  allow_stopping_for_update = true


  boot_disk {
    initialize_params {
      image = var.vm_image
      type = "pd-standard"
      size = 10
    }
  }


  network_interface {
    network = module.network.out_vpc_name
    subnetwork = module.network.out_mangement-sub_name
  }
    depends_on = [
    module.network
  ]

    service_account {
    email = google_service_account.bastion_sa.email
    scopes = [ "cloud-platform" ]
     # deal with Google Cloud data
  }
}