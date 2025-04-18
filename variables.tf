variable "environment" {
    description = "The environment for deployment (e.g., dev, staging, prod)"
    type        = string
    default     = "dev"
}

variable "region" {
    description = "The GCP region to deploy resources in"
    type        = string
    default     = "us-east-1"
}

variable "instance_type" {
    description = "The type of VM instance to use"
    type        = string
    default     = "t2.micro"
}

variable "tags" {
    description = "A map of tags to apply to resources"
    type        = map(string)
    default     = {
        Project = "SampleProject"
        Owner   = "YourName"
    }
}

variable "project_id" {
    description = "The GCP project ID"
    type        = string
}

variable "viewer_role" {
    description = "The role for viewers"
    type        = string
}

variable "viewer_member" {
    description = "The member to assign the viewer role"
    type        = string
}

variable "editor_role" {
    description = "The role for editors"
    type        = string
}

variable "editor_members" {
    description = "The members to assign the editor role"
    type        = list(string)
}

variable "owner_role" {
    description = "The role for owners"
    type        = string
}

variable "owner_member" {
    description = "The member to assign the owner role"
    type        = string
}

variable "service_account_id" {
    description = "The ID of the service account"
    type        = string
}

variable "service_account_display_name" {
    description = "The display name of the service account"
    type        = string
}

variable "service_account_description" {
    description = "The description of the service account"
    type        = string
}

variable "storage_admin_role" {
    description = "The role for storage admin"
    type        = string
}