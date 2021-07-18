terraform {
  backend "gcs" {
    bucket  = "veerahemanntnag-terraform-state"
    prefix  = "dev"
  }
}
