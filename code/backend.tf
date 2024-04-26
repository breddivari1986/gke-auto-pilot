terraform {
  backend "gcs" {
    // bucket = var.backend_gcs_bucket // Variables not allowed in backend
    // prefix = var.backend_gcs_bucket_prefix // Variables not allowed in backend
    # bucket = "<bucket name : test-terraformstates>"
    # prefix = "anthos/gke"
  }
}
