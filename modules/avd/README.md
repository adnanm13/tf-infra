<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_desktop_application_group.applicationgroup](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_desktop_application_group) | resource |
| [azurerm_virtual_desktop_host_pool.hostpool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_desktop_host_pool) | resource |
| [azurerm_virtual_machine_extension.domainjoin](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension) | resource |
| [azurerm_virtual_machine_extension.hostpool-dsc](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension) | resource |
| [azurerm_key_vault.key_vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |
| [azurerm_key_vault_secret.domainjoin_password](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |
| [azurerm_key_vault_secret.domainjoin_username](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_applicationgroup_name"></a> [applicationgroup\_name](#input\_applicationgroup\_name) | n/a | `string` | n/a | yes |
| <a name="input_hostpool_name"></a> [hostpool\_name](#input\_hostpool\_name) | n/a | `string` | n/a | yes |
| <a name="input_key_vault_name"></a> [key\_vault\_name](#input\_key\_vault\_name) | n/a | `string` | n/a | yes |
| <a name="input_key_vault_rg"></a> [key\_vault\_rg](#input\_key\_vault\_rg) | n/a | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_rg_workspace"></a> [rg\_workspace](#input\_rg\_workspace) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map` | n/a | yes |
| <a name="input_vm_ids"></a> [vm\_ids](#input\_vm\_ids) | n/a | `map` | n/a | yes |
| <a name="input_vm_names"></a> [vm\_names](#input\_vm\_names) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azurerm_virtual_desktop_host_pool_ids"></a> [azurerm\_virtual\_desktop\_host\_pool\_ids](#output\_azurerm\_virtual\_desktop\_host\_pool\_ids) | n/a |
<!-- END_TF_DOCS -->