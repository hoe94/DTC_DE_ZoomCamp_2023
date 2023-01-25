terraform {
  required_version = ">= 1.0"
  //backend "local" {} 
  backend "gcs" {
    bucket  = "dtc-de-tf-state"
    prefix  = "terraform/state"
  } 
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
  }
}

provider "google" {
  project = var.project
  region = var.region
}