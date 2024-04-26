# google_client_config and kubernetes provider must be explicitly specified like the following.
data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.project_id
  name                       = "gke-test-1"
  region                     = "us-east1"
  zones                      = ["us-east1-a", "us-east1-b", "us-east1-f"]
  network                    = "gke-poc-vpc"
  subnetwork                 = "gke-poc-east1"
  ip_range_pods              = "gke-pods"
  ip_range_services          = "gke-svc"
  http_load_balancing        = false
  network_policy             = false
  horizontal_pod_autoscaling = true
  filestore_csi_driver       = false  

}