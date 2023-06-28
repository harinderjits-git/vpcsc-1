## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_access_context_manager_policy"></a> [access\_context\_manager\_policy](#module\_access\_context\_manager\_policy) | ./gcp-vpc-sc | n/a |
| <a name="module_access_level_members"></a> [access\_level\_members](#module\_access\_level\_members) | ./gcp-vpc-sc/modules/access_level | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_level_name"></a> [access\_level\_name](#input\_access\_level\_name) | Access level name of the Access Policy. | `string` | `"terraform_members"` | no |
| <a name="input_host_network"></a> [host\_network](#input\_host\_network) | shared VPC Network | `string` | n/a | yes |
| <a name="input_ip_subnetworks"></a> [ip\_subnetworks](#input\_ip\_subnetworks) | A list of CIDR block IP subnetwork specification. May be IPv4 or IPv6. Note that for a CIDR IP address block, the specified IP address portion must be properly truncated (i.e. all the host bits must be zero) or the input is considered malformed. For example, "192.0.2.0/24" is accepted but "192.0.2.1/24" is not. Similarly, for IPv6, "2001:db8::/32" is accepted whereas "2001:db8::1/32" is not. The originating IP of a request must be in one of the listed subnets in order for this Condition to be true. If empty, all IP addresses are allowed. | `list(string)` | n/a | yes |
| <a name="input_members"></a> [members](#input\_members) | An allowed list of members (users, service accounts). The signed-in identity originating the request must be a part of one of the provided members. If not specified, a request may come from any user (logged in/not logged in, etc.). Formats: user:{emailid}, serviceAccount:{emailid} | `list(string)` | n/a | yes |
| <a name="input_parent_id"></a> [parent\_id](#input\_parent\_id) | The parent of this AccessPolicy in the Cloud Resource Hierarchy. As of now, only organization are accepted as parent. | `string` | n/a | yes |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | The policy's name. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | proj id. | `string` | n/a | yes |
| <a name="input_regions"></a> [regions](#input\_regions) | The request must originate from one of the provided countries/regions. Format: A valid ISO 3166-1 alpha-2 code. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_level_name"></a> [access\_level\_name](#output\_access\_level\_name) | n/a |
| <a name="output_policy_id"></a> [policy\_id](#output\_policy\_id) | n/a |
