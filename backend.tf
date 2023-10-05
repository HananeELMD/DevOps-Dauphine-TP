terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.10"
    }
  }

  backend "gcs" {
    bucket = "projet-tp6-400218-tfstate"
  }

  required_version = ">= 1.0"
}