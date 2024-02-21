# Terraform-azure-data-factory

# Terraform Azure Cloud DATA FACTORY Module

## Table of Contents
- [Introduction](#introduction)
- [Usage](#usage)
- [Examples](#examples)
- [Author](#author)
- [License](#license)
- [Inputs](#inputs)
- [Outputs](#outputs)

## Introduction
This module provides a Terraform configuration for deploying various Azure resources as part of your infrastructure. The configuration includes the deployment of resource groups, virtual networks, subnets, network security groups, Azure Key Vault, and virtual machines.

## Usage
To use this module, you should have Terraform installed and configured for AZURE. This module provides the necessary Terraform configuration
for creating AZURE resources, and you can customize the inputs as needed. Below is an example of how to use this module:

# Examples


```hcl
module "data_factory" {
  depends_on = [
    module.resource_group
  ]
  source      = "git::https://github.com/opsstation/terraform-azure-data-factory.git?ref=v1.0.0"

  name                = "app"
  environment         = "test"
  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name

}
```
This example demonstrates how to create various AZURE resources using the provided modules. Adjust the input values to suit your specific requirements.

## Examples
For detailed examples on how to use this module, please refer to the [examples](https://github.com/opsstation/terraform-azure-data-factory/blob/master/_example) directory within this repository.

## License
This Terraform module is provided under the **MIT** License. Please see the [LICENSE](https://github.com/opsstation/terraform-azure-data-factory/blob/master/LICENSE) file for more details.

## Author
Your Name
Replace **MIT** and **Cypik** with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=2.90.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=2.90.0 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.0.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_labels"></a> [labels](#module\_labels) | git::https://github.com/opsstation/terraform-azure-labels.git | v1.0.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_data_factory.factory](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory) | resource |
| [azurerm_key_vault_key.kvkey](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_key) | resource |
| [azurerm_private_dns_a_record.arecord](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_a_record) | resource |
| [azurerm_private_dns_zone.dnszone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_endpoint.pep](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_role_assignment.identity_assigned](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_user_assigned_identity.identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |
| [random_string.random](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [azurerm_private_endpoint_connection.private-ip-0](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_endpoint_connection) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cmk_encryption_enabled"></a> [cmk\_encryption\_enabled](#input\_cmk\_encryption\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_enable_private_endpoint"></a> [enable\_private\_endpoint](#input\_enable\_private\_endpoint) | enable or disable private endpoint to storage account | `bool` | `false` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Flag to control the module creation. | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| <a name="input_existing_private_dns_zone"></a> [existing\_private\_dns\_zone](#input\_existing\_private\_dns\_zone) | Name of the existing private DNS zone | `string` | `null` | no |
| <a name="input_existing_private_dns_zone_resource_group_name"></a> [existing\_private\_dns\_zone\_resource\_group\_name](#input\_existing\_private\_dns\_zone\_resource\_group\_name) | The name of the existing resource group | `string` | `""` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | Specifies the type of Managed Service Identity that should be configured on this Storage Account. Possible values are `SystemAssigned`, `UserAssigned`, `SystemAssigned, UserAssigned` (to enable both). | `string` | `"SystemAssigned"` | no |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | n/a | `string` | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Label order, e.g. `name`,`application`. | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | Location where resource should be created. | `string` | `""` | no |
| <a name="input_managed_virtual_network_enabled"></a> [managed\_virtual\_network\_enabled](#input\_managed\_virtual\_network\_enabled) | Is default virtual machine enabled for data factory or not. | `bool` | `null` | no |
| <a name="input_managedby"></a> [managedby](#input\_managedby) | ManagedBy, eg 'opsstation'. | `string` | `"anmol@opsstation.com"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| <a name="input_private_dns_zone_name"></a> [private\_dns\_zone\_name](#input\_private\_dns\_zone\_name) | The name of the private dns zone name which will used to create private endpoint link. | `string` | `"privatelink.blob.core.windows.net"` | no |
| <a name="input_public_network_enabled"></a> [public\_network\_enabled](#input\_public\_network\_enabled) | Is the Data Factory visible to the public network? Defaults to true. | `bool` | `true` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | Terraform current module repo | `string` | `""` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the virtual network. | `string` | `""` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The resource ID of the subnet | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_identity"></a> [identity](#output\_identity) | n/a |
<!-- END_TF_DOCS -->