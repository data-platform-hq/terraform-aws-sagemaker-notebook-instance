# AWS SageMaker Notebook instance Terraform module
Terraform module for AWS SageMaker Notebook instance creation

## Usage

```hcl
module "sagemaker_notebook" {
  source  = "data-platform-hq/athena/aws"
  version = "~> 1.0"
  
  tags = {
    ENV: "DEV"
  }
  
  name          = "notebook-1"
  role_arn      = "arn:aws:iam::123456789123:role/service-role/aws-role"
  instance_type = "ml.t3.medium"
  lifecycle_configuration = {
    enabled   = true
    name      = "lifecycle_config1"
    create    = true
    on_create = "IyEvYmluL2Jhc2gKCmVjaG8gIkhlbGxvIHdvcmxkIgo="
    on_start  = "IyEvYmluL2Jhc2gKCmVjaG8gIkhlbGxvIHdvcmxkIgo="
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name                                                                        | Version  |
|-----------------------------------------------------------------------------|----------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform)   | >= 1.0   |
| <a name="requirement_aws"></a> [aws](#requirement\_aws)                     | >= 5.1.0 |

## Providers

| Name                                                | Version  |
|-----------------------------------------------------|----------|
| <a name="provider_aws"></a> [aws](#provider\_aws)   | >= 5.1.0 |

## Modules

No modules.

## Resources

| Name                                                                                                                                                                                            | Type     |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|
| [aws_sagemaker_notebook_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sagemaker_notebook_instance)                                                 | resource |
| [aws_sagemaker_notebook_instance_lifecycle_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sagemaker_notebook_instance_lifecycle_configuration) | resource |

## Inputs

| Name                                                                                                                                                                            | Description                                                                                                                                                                                          | Type                                                                                                                                                                                     | Default                                                     | Required |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------|:--------:|
| <a name="input_create"></a> [create](#input\_create)                                                                                                                            | Controls if resources should be created (affects nearly all resources)                                                                                                                               | `bool`                                                                                                                                                                                   | `true`                                                      |    no    |
| <a name="input_tags"></a> [tags](#input\_tags)                                                                                                                                  | A map of tags to add to all resources                                                                                                                                                                | `map(string)`                                                                                                                                                                            | `{}`                                                        |    no    |
| <a name="input_name"></a> [name](#input\_name)                                                                                                                                  | The name of the notebook instance (must be unique)                                                                                                                                                   | `string`                                                                                                                                                                                 | n/a                                                         |   yes    |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn)                                                                                                                    | The ARN of the IAM role to be used by the notebook instance which allows SageMaker to call other services on your behalf                                                                             | `string`                                                                                                                                                                                 | n/a                                                         |   yes    |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type)                                                                                                     | The name of ML compute instance type                                                                                                                                                                 | `string`                                                                                                                                                                                 | n/a                                                         |   yes    |
| <a name="input_platform_identifier"></a> [platform\_identifier](#input\_platform\_identifier)                                                                                   | The platform identifier of the notebook instance runtime environment. This value can be either notebook-al1-v1, notebook-al2-v1, or notebook-al2-v2                                                  | `string`                                                                                                                                                                                 | `null`                                                      |    no    |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size)                                                                                                           | The size, in GB, of the ML storage volume to attach to the notebook instance                                                                                                                         | `number`                                                                                                                                                                                 | `null`                                                      |    no    |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id)                                                                                                                 | The VPC subnet ID                                                                                                                                                                                    | `string`                                                                                                                                                                                 | `null`                                                      |    no    |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups)                                                                                               | The associated security groups                                                                                                                                                                       | `list(string)`                                                                                                                                                                           | `null`                                                      |    no    |
| <a name="input_accelerator_types"></a> [accelerator\_types](#input\_accelerator\_types)                                                                                         | A list of Elastic Inference (EI) instance types to associate with this notebook instance. Valid values: ml.eia1.medium, ml.eia1.large, ml.eia1.xlarge, ml.eia2.medium, ml.eia2.large, ml.eia2.xlarge | `list(string)`                                                                                                                                                                           | `null`                                                      |    no    |
| <a name="input_accelerator_additional_code_repositoriestypes"></a> [accelerator\_additional\_code\_repositoriestypes](#input\_accelerator\_additional\_code\_repositoriestypes) | An array of up to three Git repositories to associate with the notebook instance                                                                                                                     | `list(string)`                                                                                                                                                                           | `null`                                                      |    no    |
| <a name="input_default_code_repository"></a> [default\_code\_repository](#input\_default\_code\_repository)                                                                     | The Git repository associated with the notebook instance as its default code repository                                                                                                              | `string`                                                                                                                                                                                 | `null`                                                      |    no    |
| <a name="input_direct_internet_access"></a> [direct\_internet\_access](#input\_direct\_internet\_access)                                                                        | Set to false to disable internet access to notebook. Requires security_groups and subnet_id to be set                                                                                                | `bool`                                                                                                                                                                                   | `true`                                                      |    no    |
| <a name="input_instance_metadata_service_configuration"></a> [instance\_metadata\_service\_configuration](#input\_instance\_metadata\_service\_configuration)                   | Information on the IMDS configuration of the notebook instance                                                                                                                                       | <pre>object({<br/>  enabled                                   = optional(bool, false)<br/>  minimum_instance_metadata_service_version = optional(number)<br/>})</pre>                    | <pre>{<br/>  enabled = false<br/>}</pre>                    |    no    |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id)                                                                                                            | The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to encrypt the model artifacts at rest using Amazon S3 server-side encryption                                                | `string`                                                                                                                                                                                 | `null`                                                      |    no    |
| <a name="input_root_access"></a> [root\_access](#input\_root\_access)                                                                                                           | Whether root access is enabled or disabled for users of the notebook instance                                                                                                                        | `bool`                                                                                                                                                                                   | `true`                                                      |    no    |
| <a name="input_lifecycle_configuration"></a> [lifecycle\_configuration](#input\_lifecycle\_configuration)                                                                       | Provides a lifecycle configuration for SageMaker Notebook Instances                                                                                                                                  | <pre>object({<br/>  enabled   = bool<br/>  name      = string<br/>  create    = optional(bool, false)<br/>  on_create = optional(string)<br/>  on_start  = optional(string)<br/>})</pre> | <pre>{<br/>  enabled = false<br/>  name    = ""<br/>}</pre> |    no    |

## Outputs

| Name                                                                                                  | Description                                                                                       |
|-------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------|
| <a name="output_id"></a> [id](#output\_id)                                                            | The name of the notebook instance                                                                 |
| <a name="output_arn"></a> [arn](#output\_arn)                                                         | The Amazon Resource Name (ARN) assigned by AWS to this notebook instance                          |
| <a name="output_url"></a> [url](#output\_url)                                                         | The URL that you use to connect to the Jupyter notebook that is running in your notebook instance |
| <a name="output_network_interface_id"></a> [dnetwork\_interface\_id](#output\_network\_interface\_id) | The network interface ID that Amazon SageMaker created at the time of creating the instance       |
<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-azurerm-linux-web-app/tree/main/LICENSE)
