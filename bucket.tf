provider "google" {
    project = "your-gcp-project-id"
    region  = "us-central1"
}

resource "google_storage_bucket" "example_bucket" {
    name          = "example-bucket-name"
    location      = "US"
    storage_class = "STANDARD"

    versioning {
        enabled = true
    }

    lifecycle_rule {
        action {
            type = "Delete"
        }
        condition {
            age = 365
        }
    }
}
resource "google_storage_bucket" "another_bucket" {
    name          = "another-bucket-name"
    location      = "US"
    storage_class = "NEARLINE"

    versioning {
        enabled = false
    }

    lifecycle_rule {
        action {
            type = "SetStorageClass"
            storage_class = "COLDLINE"
        }
        condition {
            age = 180
        }
    }
}
resource "google_storage_bucket_object" "example_object" {
    name   = "example-object-name"
    bucket = google_storage_bucket.example_bucket.name
    content = "This is the content of the object."

    metadata = {
        key1 = "value1"
        key2 = "value2"
    }
}