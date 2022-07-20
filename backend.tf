terraform {
  backend "gcs" {
    bucket  = "terra-back"
    prefix  = "terraform/state"
  }
}
