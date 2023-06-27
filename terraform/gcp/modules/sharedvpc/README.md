## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_serviceproj"></a> [serviceproj](#module\_serviceproj) | ./serviceproj | n/a |

## Resources

| Name | Type |
|------|------|
| [google_compute_shared_vpc_host_project.host](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_shared_vpc_host_project) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_host_project"></a> [host\_project](#input\_host\_project) | Billing account id. | `string` | `null` | no |
| <a name="input_service_projects"></a> [service\_projects](#input\_service\_projects) | n/a | <pre>map(object ({<br>    project_name = string<br>    subnets = list (object({<br>      name = string<br>      region = string<br>    }))<br>  }))</pre> | `null` | no |

## Outputs

No outputs.
