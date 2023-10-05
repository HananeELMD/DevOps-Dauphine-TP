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


resource "google_cloud_run_service" "default" {
name     = "serveur-wordpress"
location = "us-central1"

template {
   spec {
      containers {
      image = "us-central1-docker.pkg.dev/projet-tp2-400218/website-tools/wordpress"
      ports {
        container_port = 80
      }
   }
   }
   metadata {
      annotations = {
            "run.googleapis.com/cloudsql-instances" = "projet-tp2-400218:us-central1:main-instance"
      }
   }
}

traffic {
   percent         = 100
   latest_revision = true
}
}

data "google_iam_policy" "noauth" {
   binding {
      role = "roles/run.invoker"
      members = [
         "allUsers",
      ]
   }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
   location    = google_cloud_run_service.default.location
   project     = google_cloud_run_service.default.project
   service     = google_cloud_run_service.default.name

   policy_data = data.google_iam_policy.noauth.policy_data
}