resource "google_project_service" "ressource_manager" {
    service = "cloudresourcemanager.googleapis.com"
        depends_on = [ google_project_service.serviceusage ]

}

resource "google_project_service" "serviceusage" {
    service = "serviceusage.googleapis.com"
}


resource "google_project_service" "sqladmin" {
    service = "sqladmin.googleapis.com"
    depends_on = [ google_project_service.ressource_manager ]

}
resource "google_project_service" "cloudressource" {
    service = "cloudresourcemanager.googleapis.com"
    depends_on = [ google_project_service.ressource_manager ]
}
resource "google_project_service" "artifactregistry" {
    service = "artifactregistry.googleapis.com"
    depends_on = [ google_project_service.ressource_manager ]
}

resource "google_project_service" "cloudbuild" {
    service = "cloudbuild.googleapis.com"
        depends_on = [ google_project_service.ressource_manager ]

}
resource "google_artifact_registry_repository" "devops-exam" {
  location      = "us-central1"
  repository_id = "website-tools"
  description   = "Exam TP"
  format        = "DOCKER"
}

resource "google_sql_user" "wordpress" {
   name     = "wordpress"
   instance = "main-instance"
   password = "ilovedevops"
}



