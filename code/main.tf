# google_client_config and kubernetes provider must be explicitly specified like the following.
data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google//modules/beta-autopilot-private-cluster"
  version = "~> 30.0"
 # source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.project_id
  regional                   = true
  name                       = var.name
  region                     = var.region
  network                    = var.network
  subnetwork                 = var.subnetwork
  ip_range_pods              = var.ip_range_pods
  ip_range_services          = var.ip_range_services
  release_channel            = "REGULAR"
  http_load_balancing        = false
#  network_policy             = false
  horizontal_pod_autoscaling = true
#  filestore_csi_driver       = false
  create_service_account = var.create_service_account
  service_account = var.service_account

}
