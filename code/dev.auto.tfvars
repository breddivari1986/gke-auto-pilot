project_id               = "gke-svc-prj"
name  = "gke-autopilot-primary"
network             = "gke-poc-vpc"
subnetwork              = "gke-poc-east1"
zones                      = ["us-east1-b", "us-east1-c", "us-east1-d"]
network_project_id       = "gke-host-prj"
ip_range_pods          = "ip-range-pods-autopilot"
ip_range_services           = "ip-range-svc-autopilot"
region                   = "us-east1"
master_ipv4_cidr_block   = "192.168.0.0/20" #For Master Cluster
initial_node_count = 1
service_account = "gke-svc-acc@gke-svc-prj.iam.gserviceaccount.com"
create_service_account = false
project = "gke-svc-prj"
