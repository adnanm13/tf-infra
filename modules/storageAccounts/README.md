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
| [azurerm_storage_account.storage_accounts](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_container.storage_containers](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_rg_storage"></a> [rg\_storage](#input\_rg\_storage) | n/a | `string` | n/a | yes |
| <a name="input_storage_accounts"></a> [storage\_accounts](#input\_storage\_accounts) | n/a | `list(string)` | n/a | yes |
| <a name="input_storage_containers"></a> [storage\_containers](#input\_storage\_containers) | n/a | `map(any)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->