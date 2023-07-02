[![Build Status](https://dev.azure.com/devopsinsiderssit/devopsinsiders-SIT/_apis/build/status/devopsinsiders-az-infra-tf?branchName=main)](https://dev.azure.com/devopsinsiderssit/devopsinsiders-SIT/_build/latest?definitionId=5&branchName=main)

# Introduction 
This Module is used to provision basic infra for devopsinsiders-SIT Environment.

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
| <a name="module_activeDirectory"></a> [activeDirectory](#module\_activeDirectory) | ../../../modules/activeDirectory | n/a |
| <a name="module_keyVault"></a> [keyVault](#module\_keyVault) | ../../../modules/keyVault | n/a |
| <a name="module_networking"></a> [networking](#module\_networking) | ../../../modules/networking | n/a |
| <a name="module_resource_groups"></a> [resource\_groups](#module\_resource\_groups) | ../../../modules/resourceGroups | n/a |
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | ../../../modules/storageAccounts | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ad_domain"></a> [ad\_domain](#input\_ad\_domain) | n/a | `string` | n/a | yes |
| <a name="input_ad_subnet"></a> [ad\_subnet](#input\_ad\_subnet) | n/a | `string` | n/a | yes |
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | n/a | `string` | n/a | yes |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | n/a | `string` | n/a | yes |
| <a name="input_applicationgroup_name"></a> [applicationgroup\_name](#input\_applicationgroup\_name) | n/a | `string` | n/a | yes |
| <a name="input_avd_subnet"></a> [avd\_subnet](#input\_avd\_subnet) | n/a | `string` | n/a | yes |
| <a name="input_hostpool_name"></a> [hostpool\_name](#input\_hostpool\_name) | n/a | `string` | n/a | yes |
| <a name="input_keyvault_name"></a> [keyvault\_name](#input\_keyvault\_name) | n/a | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_resource_groups_config"></a> [resource\_groups\_config](#input\_resource\_groups\_config) | n/a | `any` | n/a | yes |
| <a name="input_rg_application"></a> [rg\_application](#input\_rg\_application) | n/a | `string` | n/a | yes |
| <a name="input_rg_networking"></a> [rg\_networking](#input\_rg\_networking) | n/a | `string` | n/a | yes |
| <a name="input_rg_storage"></a> [rg\_storage](#input\_rg\_storage) | n/a | `string` | n/a | yes |
| <a name="input_rg_workspace"></a> [rg\_workspace](#input\_rg\_workspace) | n/a | `string` | n/a | yes |
| <a name="input_storage_accounts"></a> [storage\_accounts](#input\_storage\_accounts) | n/a | `list(string)` | n/a | yes |
| <a name="input_storage_containers"></a> [storage\_containers](#input\_storage\_containers) | n/a | `map(any)` | n/a | yes |
| <a name="input_subnets_config"></a> [subnets\_config](#input\_subnets\_config) | n/a | `map(any)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | n/a | yes |
| <a name="input_vpc_config"></a> [vpc\_config](#input\_vpc\_config) | n/a | `any` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->