# Terraform Configuration

This directory contains Terraform configurations to set up a GCP environment with:
- A VPC with public and private subnets
- A Compute Engine instance with a web server
- Firewall rules for HTTP/HTTPS traffic

## Usage

1. Update `variables.tf` with your GCP project information.
2. Run `terraform init` to initialize the configuration.
3. Run `terraform apply` to create the resources.
4. Check the output for the instance IP.
