resource "google_project_service" "serviceusage" {
    project = "devops-exam"
    service = "serviceusage.googleapis.com"
}

resource "google_project_service" "sqladmin" {
    project = "devops-exam"
    service = "sqladmin.googleapis.com"
}
resource "google_project_service" "cloudressource" {
    project = "devops-exam"
    service = "cloudresourcemanager.googleapis.com"
}
resource "google_project_service" "artifactregistry" {
    project = "devops-exam"
    service = "artifactregistry.googleapis.com"
}

resource "google_project_service" "cloudbuild" {
    project = "devops-exam"
    service = "cloudbuild.googleapis.com"
}
resource "google_artifact_registry_repository" "devops-exam" {
  location      = "us-central1"
  repository_id = "website-tools"
  description   = "Exam TP"
  format        = "DOCKER"
}

resource "google_sql_user" "wordpress" {
    project = "projet-tp6-400218"
   name     = "wordpress"
   instance = "main-instance"
   password = "ilovedevops"
}



