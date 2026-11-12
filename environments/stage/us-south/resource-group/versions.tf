terraform {
  required_version = ">= 1.6.3"

  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "~> 2.8"
    }
  }
}
