resource "google_service_account" "bastion_sa" {
  account_id   = "bastion_sa"
}


resource "google_project_iam_binding" "bastion_iam_role" {
  project = var.project_id
  role    = "roles/container.admin" 
  members = [
    "serviceAccount:${google_service_account.bastion_sa.email}"
  ]
}