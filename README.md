# CI/CD Pipeline and Monitoring

This directory contains GitHub Actions workflows to:
- Deploy the application to a GCP instance
- Monitor CPU usage and send alerts

## CI/CD Pipeline

The `ci-cd.yml` file sets up a pipeline to:
1. Pull code from the repository
2. Build and test the application
3. Deploy to the Compute Engine instance

## Monitoring Alert

The `monitoring-alert.yml` file schedules a job to check CPU usage and send alerts if necessary.
