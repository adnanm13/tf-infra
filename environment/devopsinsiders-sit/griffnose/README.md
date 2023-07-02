[![Build Status](https://dev.azure.com/devopsinsiderssit/devopsinsiders-SIT/_apis/build/status/griffnose?branchName=main)](https://dev.azure.com/devopsinsiderssit/devopsinsiders-SIT/_build/latest?definitionId=9&branchName=main)

# Introduction 
This Module is used to provision Infra for griffnose Application in devopsinsiders-SIT Environment.

# Getting Started
TODO: Guide users through getting your code up and running on their own system. In this section you can talk about:
1.	terraform init
2.  terraform validate
3.	terraform plan
4.	terraform apply

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.19.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_griffnose_vms"></a> [griffnose\_vms](#module\_griffnose\_vms) | ../../../modules/windowsVMs | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ad_domain"></a> [ad\_domain](#input\_ad\_domain) | n/a | `string` | n/a | yes |
| <a name="input_ad_subnet"></a> [ad\_subnet](#input\_ad\_subnet) | n/a | `string` | n/a | yes |
| <a name="input_applicationgroup_name"></a> [applicationgroup\_name](#input\_applicationgroup\_name) | n/a | `string` | n/a | yes |
| <a name="input_avd_subnet"></a> [avd\_subnet](#input\_avd\_subnet) | n/a | `string` | n/a | yes |
| <a name="input_hostpool_name"></a> [hostpool\_name](#input\_hostpool\_name) | n/a | `string` | n/a | yes |
| <a name="input_key_vault_name"></a> [key\_vault\_name](#input\_key\_vault\_name) | n/a | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_rg_networking"></a> [rg\_networking](#input\_rg\_networking) | n/a | `string` | n/a | yes |
| <a name="input_rg_workspace"></a> [rg\_workspace](#input\_rg\_workspace) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | n/a | yes |
| <a name="input_vm_names"></a> [vm\_names](#input\_vm\_names) | n/a | `any` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->