variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The GCP zone"
  type        = string
  default     = "us-central1-a"
}

variable "gcs_bucket_name" {
  description = "The name of the GCS bucket"
  type        = string
  default     = "global-health-data-bucket"
}

variable "bigquery_dataset" {
  description = "BigQuery dataset ID for staging data"
  type        = string
  default     = "staging_dataset"
}
