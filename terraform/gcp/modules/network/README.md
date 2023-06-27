## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_network"></a> [network](#module\_network) | ./vpc | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_department_code"></a> [department\_code](#input\_department\_code) | Code for department, part of naming module | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | S-Sandbox P-Production Q-Quality D-development | `string` | n/a | yes |
| <a name="input_networks"></a> [networks](#input\_networks) | list of netork maps. See examples directory | <pre>list(object({<br>    network_name                           = string<br>    routing_mode                           = string<br>    auto_create_subnetworks                = optional(string)<br>    description                            = optional(string)<br>    delete_default_internet_gateway_routes = optional(bool)<br>    subnet_flow_logs                       = optional(bool)<br>    mtu                                    = optional(string)<br>    private_service_address_prefix_length  = optional(string)<br>    private_service_address_range          = optional(string)<br>    network_peer_name                      = optional(string)<br>    subnets = list(object({<br>      subnet_name           = string<br>      subnet_ip             = string<br>      subnet_region         = string<br>      subnet_private_access = optional(bool)<br>      description           = optional(string)<br>      secondary_ip_ranges = optional(list(object({<br>        range_name    = string<br>        ip_cidr_range = string<br>      })))<br>    }))<br>    routes = optional(list(object({<br>      route_name             = string<br>      description            = optional(string)<br>      destination_range      = optional(string)<br>      tags                   = string<br>      next_hop_internet      = optional(bool)<br>      next_hop_ip            = optional(string)<br>      next_hop_instance      = optional(string)<br>      next_hop_instance_zone = optional(string)<br>      next_hop_vpn_tunnel    = optional(string)<br>      next_hop_ilb           = optional(string)<br>      priority               = optional(string)<br>    })))<br>    routers = optional(list(object({<br>      router_name = string<br>      description = string<br>      region      = string<br>      bgp = optional(object({<br>        asn              = string<br>        advertise_groups = optional(string)<br>      }))<br>    })))<br>    nat = optional(list(object({<br>      nat_name                           = string<br>      region                             = string<br>      nat_ips                            = optional(list(string))<br>      icmp_idle_timeout_sec              = optional(string)<br>      min_ports_per_vm                   = optional(string)<br>      nat_ip_allocate_option             = optional(string)<br>      router_asn                         = optional(string)<br>      source_subnetwork_ip_ranges_to_nat = optional(string)<br>      tcp_established_idle_timeout_sec   = optional(string)<br>      tcp_transitory_idle_timeout_sec    = optional(string)<br>      udp_idle_timeout_sec               = optional(string)<br>      nat_subnetworks = optional(list(object({<br>        name                     = string,<br>        source_ip_ranges_to_nat  = list(string)<br>        secondary_ip_range_names = list(string)<br>      })))<br>      log_config_enable                   = optional(string)<br>      log_config_filter                   = optional(string)<br>      enable_endpoint_independent_mapping = optional(string)<br>    })))<br>  }))</pre> | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | Division or group responsible for security and financial commitment. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | project where network will be created | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Location for naming and resource placement | `string` | `"northamerica-northeast1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | The VPC resource being created |
