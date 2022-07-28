resource "google_service_account" "bastion-sa" {
  account_id = "bastion-sa"
}

resource "google_project_iam_binding" "bastion_iam_role" {
  project = var.project_id
  role    = "roles/container.admin"
  members = [
    "serviceAccount:${google_service_account.bastion-sa.email}"
  ]
}

#-----------------------------------------------------------------

resource "google_service_account" "gke-node-sa" {
  account_id   = "gke-node-sa"
}

resource "google_project_iam_member" "gke_role1" {
  project = var.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.gke-node-sa.email}"
}
resource "google_project_iam_member" "gke_role2" {
  project = var.project_id
  role    = "roles/artifactregistry.admin"
  member  = "serviceAccount:${google_service_account.gke-node-sa.email}"
}