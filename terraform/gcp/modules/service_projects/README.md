## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_service_projects"></a> [service\_projects](#module\_service\_projects) | ./projectmodule | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_create_network"></a> [auto\_create\_network](#input\_auto\_create\_network) | Whether to create the default network for the project | `bool` | `false` | no |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | Billing account id. | `string` | `null` | no |
| <a name="input_host_project"></a> [host\_project](#input\_host\_project) | Billing account id. | `string` | `null` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Resource labels. | `map(string)` | `{}` | no |
| <a name="input_oslogin"></a> [oslogin](#input\_oslogin) | Enable OS Login. | `bool` | `false` | no |
| <a name="input_oslogin_admins"></a> [oslogin\_admins](#input\_oslogin\_admins) | List of IAM-style identities that will be granted roles necessary for OS Login administrators. | `list(string)` | `[]` | no |
| <a name="input_oslogin_users"></a> [oslogin\_users](#input\_oslogin\_users) | List of IAM-style identities that will be granted roles necessary for OS Login users. | `list(string)` | `[]` | no |
| <a name="input_parent"></a> [parent](#input\_parent) | Parent folder or organization in 'folders/folder\_id' or 'organizations/org\_id' format. | `string` | `null` | no |
| <a name="input_policy_boolean"></a> [policy\_boolean](#input\_policy\_boolean) | Map of boolean org policies and enforcement value, set value to null for policy restore. | `map(bool)` | `{}` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Billing account id. | `string` | `null` | no |
| <a name="input_service_config"></a> [service\_config](#input\_service\_config) | Configure service API activation. | <pre>object({<br>    disable_on_destroy         = bool<br>    disable_dependent_services = bool<br>  })</pre> | <pre>{<br>  "disable_dependent_services": true,<br>  "disable_on_destroy": true<br>}</pre> | no |
| <a name="input_service_projects"></a> [service\_projects](#input\_service\_projects) | n/a | <pre>map(object ({<br>    project_name = string<br>    subnets = list (object({<br>      name = string<br>      region = string<br>    }))<br>  }))</pre> | `null` | no |
| <a name="input_services"></a> [services](#input\_services) | Service APIs to enable. | `list(string)` | `[]` | no |

## Outputs

No outputs.
