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