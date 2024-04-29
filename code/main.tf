
module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google//modules/beta-autopilot-private-cluster"          
#  version = "~> 30.0"
 # source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.project_id
  network_project_id         = "gke-host-prj"
  zones                      = var.zones
  regional                   = true
  name                       = var.name
  region                     = var.region
  network                    = var.network
  subnetwork                 = var.subnetwork
  ip_range_pods              = var.ip_range_pods
  ip_range_services          = var.ip_range_services
  release_channel            = "REGULAR"
  http_load_balancing        = true
#  network_policy             = false
  horizontal_pod_autoscaling = true
#  filestore_csi_driver       = false
  create_service_account = var.create_service_account
  service_account = var.service_account

}
