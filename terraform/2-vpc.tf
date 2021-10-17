module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 3.0"

    project_id   = local.project
    network_name = NETWORK.NAME		#example ~> "project-123456-network"
    routing_mode = "REGIONAL"

    subnets = [
        {
            subnet_name           = "core-sub-europe-west1"
            subnet_ip             = "10.1.0.0/24"
            subnet_region         = local.region
            subnet_private_access = "false"
            subnet_flow_logs      = "false"
        },
    ]

    routes = [
        {
            name                   = "egress-internet"
            description            = "route to access internet"
            destination_range      = "0.0.0.0/0"
            tags                   = "egress-inet"
            next_hop_internet      = "true"
        }
    ]
}
