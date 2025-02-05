provider "google" {
  project = var.project_id
  region  = var.region
}

# Compute Engine Instance
resource "google_compute_instance" "vm_instance" {
  name         = "airflow-instance"
  machine_type = "e2-standard-2"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}

# Firewall Rule for HTTP and HTTPS
resource "google_compute_firewall" "http_https" {
  name    = "allow-http-https"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# Firewall Rule for Ingress on Port 8080
resource "google_compute_firewall" "ingress_8080" {
  name    = "allow-port"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# GCS Bucket
resource "google_storage_bucket" "gcs_bucket" {
  name          = var.gcs_bucket_name
  location      = var.region
  force_destroy = true
}

# Service Account
resource "google_service_account" "dbt_sa" {
  account_id   = "medical-data-account"
  display_name = "DBT Service Account"
}

# BigQuery Dataset
resource "google_bigquery_dataset" "staging_dataset" {
  dataset_id = var.bigquery_dataset
  project    = var.project_id
  location   = var.region
}
