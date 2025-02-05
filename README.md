# Global Health Data ELT Pipeline

## Project Overview:
This project implements an ELT (Extract, Load, Transform) data pipeline to process and analyze global health data using Google Cloud Platform (GCP), Apache Airflow, and dbt (data build tool). The pipeline extracts data from Google Cloud Storage (GCS), loads it into BigQuery, and applies transformations to create region-specific tables and views for analysis.

## Features:
- Extract health data from GCS in CSV format
- Load raw data into a BigQuery staging table
- Transform data into region-specific tables using dbt
- Generate reporting views with derived metrics and status indicators
- Use Apache Airflow to orchestrate the pipeline
- Create visualizations in Looker Studio for each region
- Infrastructure as Code (IaC) using Terraform for GCP resource management

## Architecture:
- Data Source: CSV files in Google Cloud Storage
- Orchestration: Apache Airflow running on Google Compute Engine
- Data Warehouse: Google BigQuery
- Transformation: dbt (data build tool)
- Visualization: Looker Studio
- Infrastructure: Terraform for GCP resource provisioning

## Data Layers
- Staging Layer: Raw data loaded from CSV files
- Transform Layer: Cleaned and transformed tables with derived metrics
- Reporting Layer: Views optimized for analysis and reporting

## Workflow
- Extract: Check for file existence in GCS
- Load: Load raw CSV data into a BigQuery staging table
- Transform:
    Create region-specific tables in the transform layer
    Generate derived metrics and status indicators
- Report: Create views in the reporting layer for each region
    Visualize: Build dashboards in Looker Studio using the reporting views

## Requirements
- Google Cloud Platform account
- Apache Airflow
- dbt (data build tool)
- Terraform
- Python 3.7+

