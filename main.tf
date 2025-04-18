provider "google" {
    project = "my-sample-project-id"
    region  = "us-central1"
    zone    = "us-central1-a"
}

resource "google_project" "sample_project" {
    name       = "Sample Project"
    project_id = "my-sample-project-id"
    org_id     = "123456789012" # Replace with your organization ID
    billing_account = "000000-000000-000000" # Replace with your billing account ID
}
resource "google_storage_bucket" "sample_bucket" {
    name          = "sample-bucket"
    location      = "US"
    storage_class = "STANDARD"

    lifecycle_rule {
        action {
            type = "Delete"
        }
        condition {
            age = 365
        }
    }
}