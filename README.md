# IAM Configuration

This Terraform configuration file (`iam.tf`) manages Identity and Access Management (IAM) resources in Google Cloud Platform (GCP). It defines roles and permissions for various members and service accounts.

## Resources

### 1. `google_project_iam_member`
This resource assigns a specific role to a single member in a GCP project.

- **Example**: Assigns the `viewer_role` to `viewer_member`.

### 2. `google_project_iam_binding`
This resource assigns a specific role to multiple members in a GCP project.

- **Example**: Assigns the `editor_role` to a list of `editor_members`.

### 3. `google_project_iam_policy`
This resource sets a custom IAM policy for a GCP project.

- **Example**: Assigns the `owner_role` to `owner_member` using a JSON policy.

### 4. `google_service_account`
This resource creates a service account in the GCP project.

- **Attributes**:
  - `account_id`: The unique ID of the service account.
  - `display_name`: The display name of the service account.
  - `description`: A description of the service account.

### 5. `google_project_iam_member` (Service Account Binding)
This resource assigns the `storage_admin_role` to the created service account.

- **Member**: `serviceAccount:${google_service_account.example.email}`

### 6. `google_storage_bucket_iam_member`
This resource assigns a specific role to the service account for a storage bucket.

- **Attributes**:
  - `bucket`: The name of the storage bucket.
  - `role`: The role to assign (e.g., `roles/storage.admin`).
  - `member`: `serviceAccount:${google_service_account.example.email}`

## Variables

The following variables are used in this configuration:

- `project_id`: The GCP project ID.
- `viewer_role`: The role for viewers.
- `viewer_member`: The member to assign the viewer role.
- `editor_role`: The role for editors.
- `editor_members`: The members to assign the editor role.
- `owner_role`: The role for owners.
- `owner_member`: The member to assign the owner role.
- `service_account_id`: The ID of the service account.
- `service_account_display_name`: The display name of the service account.
- `service_account_description`: The description of the service account.
- `storage_admin_role`: The role for storage admin.
- `bucket_name`: The name of the storage bucket.
- `bucket_role`: The role to assign to the service account for the storage bucket.

## Usage

1. Define the required variables in `variables.tf` or provide them via a `terraform.tfvars` file.
2. Run the following commands to deploy the resources:

```bash
terraform init
terraform plan
terraform apply