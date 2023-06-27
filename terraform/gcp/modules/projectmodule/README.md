## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_project_service_identity.gcp_sa_cloud_sql](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_project_service_identity) | resource |
| [google_compute_project_metadata_item.oslogin_meta](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_project_metadata_item) | resource |
| [google_project.project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project) | resource |
| [google_project_iam_binding.project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_binding) | resource |
| [google_project_service.project_services](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_service_account.configconnectorsa](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_create_network"></a> [auto\_create\_network](#input\_auto\_create\_network) | Whether to create the default network for the project | `bool` | `false` | no |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | Billing account id. | `string` | `null` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Resource labels. | `map(string)` | `{}` | no |
| <a name="input_oslogin"></a> [oslogin](#input\_oslogin) | Enable OS Login. | `bool` | `false` | no |
| <a name="input_oslogin_admins"></a> [oslogin\_admins](#input\_oslogin\_admins) | List of IAM-style identities that will be granted roles necessary for OS Login administrators. | `list(string)` | `[]` | no |
| <a name="input_oslogin_users"></a> [oslogin\_users](#input\_oslogin\_users) | List of IAM-style identities that will be granted roles necessary for OS Login users. | `list(string)` | `[]` | no |
| <a name="input_parent"></a> [parent](#input\_parent) | Parent folder or organization in 'folders/folder\_id' or 'organizations/org\_id' format. | `string` | `null` | no |
| <a name="input_policy_boolean"></a> [policy\_boolean](#input\_policy\_boolean) | Map of boolean org policies and enforcement value, set value to null for policy restore. | `map(bool)` | `{}` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Billing account id. | `string` | `null` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Billing account id. | `string` | `null` | no |
| <a name="input_service_config"></a> [service\_config](#input\_service\_config) | Configure service API activation. | <pre>object({<br>    disable_on_destroy         = bool<br>    disable_dependent_services = bool<br>  })</pre> | <pre>{<br>  "disable_dependent_services": true,<br>  "disable_on_destroy": true<br>}</pre> | no |
| <a name="input_services"></a> [services](#input\_services) | Service APIs to enable. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_number"></a> [number](#output\_number) | n/a |
