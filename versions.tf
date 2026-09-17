terraform {
  required_version = ">= 1.6.0"

  required_providers {
    spacelift = {
      source  = "spacelift-io/spacelift"
      version = "1.55.0"
    }
  }
}

# When running inside a Spacelift stack with admin permissions, the provider
# picks up credentials automatically. Locally, set SPACELIFT_API_KEY_ENDPOINT,
# SPACELIFT_API_KEY_ID and SPACELIFT_API_KEY_SECRET.
provider "spacelift" {}
