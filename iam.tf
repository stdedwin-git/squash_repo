resource "google_project_iam_member" "example" {
    project = var.project_id
    role    = var.viewer_role
    member  = var.viewer_member
}

resource "google_project_iam_binding" "example" {
    project = var.project_id
    role    = var.editor_role

    members = var.editor_members
}

resource "google_project_iam_policy" "example" {
    project = var.project_id

    policy_data = <<POLICY
{
    "bindings": [
        {
            "role": "${var.owner_role}",
            "members": [
                "${var.owner_member}"
            ]
        }
    ]
}
POLICY
}

resource "google_service_account" "example" {
    account_id   = var.service_account_id
    display_name = var.service_account_display_name
    description  = var.service_account_description
}

resource "google_project_iam_member" "service_account_binding" {
    project = var.project_id
    role    = var.storage_admin_role
    member  = "serviceAccount:${google_service_account.example.email}"
}
resource "google_storage_bucket_iam_member" "service_account_bucket_permission" {
    bucket = var.bucket_name
    role   = var.bucket_role
    member = "serviceAccount:${google_service_account.example.email}"
}