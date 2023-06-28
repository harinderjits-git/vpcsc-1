## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_regular_service_perimeter_1"></a> [regular\_service\_perimeter\_1](#module\_regular\_service\_perimeter\_1) | ./gcp-vpc-sc/modules/regular_service_perimeter | n/a |

## Resources

| Name | Type |
|------|------|
| [google_project.p_project_id](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_level_name"></a> [access\_level\_name](#input\_access\_level\_name) | Access level name of the Access Policy. | `string` | `"terraform_members"` | no |
| <a name="input_allowed_egress_projects"></a> [allowed\_egress\_projects](#input\_allowed\_egress\_projects) | n/a | `list(string)` | `[]` | no |
| <a name="input_host_network"></a> [host\_network](#input\_host\_network) | shared VPC Network | `string` | n/a | yes |
| <a name="input_members"></a> [members](#input\_members) | An allowed list of members (users, service accounts). The signed-in identity originating the request must be a part of one of the provided members. If not specified, a request may come from any user (logged in/not logged in, etc.). Formats: user:{emailid}, serviceAccount:{emailid} | `list(string)` | n/a | yes |
| <a name="input_parent_id"></a> [parent\_id](#input\_parent\_id) | The parent of this AccessPolicy in the Cloud Resource Hierarchy. As of now, only organization are accepted as parent. | `string` | n/a | yes |
| <a name="input_perimeter_name"></a> [perimeter\_name](#input\_perimeter\_name) | Perimeter name of the Access Policy.. | `string` | `"regular_perimeter_1"` | no |
| <a name="input_policy_id"></a> [policy\_id](#input\_policy\_id) | The policy's ID. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | proj id. | `string` | n/a | yes |
| <a name="input_protect_xvpc"></a> [protect\_xvpc](#input\_protect\_xvpc) | n/a | `bool` | `true` | no |
| <a name="input_protected_project_ids"></a> [protected\_project\_ids](#input\_protected\_project\_ids) | Project IDs of the projects INSIDE the regular service perimeter. | `list(string)` | n/a | yes |
| <a name="input_regions"></a> [regions](#input\_regions) | The request must originate from one of the provided countries/regions. Format: A valid ISO 3166-1 alpha-2 code. | `list(string)` | `[]` | no |
| <a name="input_restricted_services"></a> [restricted\_services](#input\_restricted\_services) | The request must originate from one of the provided countries/regions. Format: A valid ISO 3166-1 alpha-2 code. | `list(string)` | `[]` | no |

## Outputs

No outputs.
