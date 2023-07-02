[![Build Status](https://dev.azure.com/devopsinsiderssit/devopsinsiders-SIT/_apis/build/status/devopsinsiders-az-avd-tf?branchName=main)](https://dev.azure.com/devopsinsiderssit/devopsinsiders-SIT/_build/latest?definitionId=6&branchName=main)

# Introduction 
This Module is used to create Azure Virtual Desktop and new VDI's in the Host Pool. 

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
| <a name="module_avd"></a> [avd](#module\_avd) | ../../../modules/avd | n/a |
| <a name="module_virtual_machines"></a> [virtual\_machines](#module\_virtual\_machines) | ../../../modules/virtualMachines | n/a |

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
| <a name="input_key_vault_rg"></a> [key\_vault\_rg](#input\_key\_vault\_rg) | n/a | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_rg_networking"></a> [rg\_networking](#input\_rg\_networking) | n/a | `string` | n/a | yes |
| <a name="input_rg_workspace"></a> [rg\_workspace](#input\_rg\_workspace) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | n/a | yes |
| <a name="input_vm_names"></a> [vm\_names](#input\_vm\_names) | n/a | `any` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azurerm_virtual_desktop_host_pool_ids"></a> [azurerm\_virtual\_desktop\_host\_pool\_ids](#output\_azurerm\_virtual\_desktop\_host\_pool\_ids) | n/a |
| <a name="output_virtual_machines_ids"></a> [virtual\_machines\_ids](#output\_virtual\_machines\_ids) | n/a |
<!-- END_TF_DOCS -->