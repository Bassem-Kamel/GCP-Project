resource "google_compute_instance" "bastion-vm" {
  name                      = "bastion-vm"
  project                   = "pythonapp-project"
  machine_type              = var.vm_type
  zone                      = var.vm_zone
  allow_stopping_for_update = true
  #If true, allows Terraform to stop the instance to update its properties. If you try to update a property that requires stopping the instance without setting this field, the update will fail.


  boot_disk {
    initialize_params {
      image = var.vm_image  #The image from which this disk was initialized.
      type  = "pd-standard" #The GCE disk type. One of pd-standard or pd-ssd.
      size  = 10            #The size of the image in gigabytes
    }
  }


  network_interface {
    network    = module.network.out_vpc_name
    subnetwork = module.network.out_mangement-sub_name
  }
  depends_on = [
    module.network
  ]

  service_account {
    email  = google_service_account.bastion-sa.email
    scopes = ["cloud-platform"]
    # A list of service scopes.To allow full access to all Cloud APIs, use the cloud-platform scope
  }
}