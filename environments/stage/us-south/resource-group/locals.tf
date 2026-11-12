locals {
  # This folder is one Schematics deployment target: one account + one region.
  # Copy this folder for another environment or region and change these values.
  environment = "stage"
  region      = "us-south"

  resource_group_name = "psl-sre-${local.environment}-${local.region}"
}
