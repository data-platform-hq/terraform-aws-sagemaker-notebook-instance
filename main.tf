resource "aws_sagemaker_notebook_instance" "this" {
  count                        = var.create ? 1 : 0
  name                         = var.name
  role_arn                     = var.role_arn
  instance_type                = var.instance_type
  platform_identifier          = var.platform_identifier
  volume_size                  = var.volume_size
  subnet_id                    = var.subnet_id
  security_groups              = var.security_groups
  accelerator_types            = var.accelerator_types
  additional_code_repositories = var.accelerator_additional_code_repositoriestypes
  default_code_repository      = var.default_code_repository
  direct_internet_access       = var.direct_internet_access ? "Enabled" : "Disabled"
  kms_key_id                   = var.kms_key_id
  lifecycle_config_name        = var.lifecycle_configuration.enabled ? var.lifecycle_configuration.create ? aws_sagemaker_notebook_instance_lifecycle_configuration.this[0].name : var.lifecycle_configuration.name : null
  root_access                  = var.root_access ? "Enabled" : "Disabled"
  tags                         = var.tags

  dynamic "instance_metadata_service_configuration" {
    for_each = var.instance_metadata_service_configuration.enabled ? [1] : []
    content {
      minimum_instance_metadata_service_version = var.instance_metadata_service_configuration.minimum_instance_metadata_service_version
    }
  }
}

resource "aws_sagemaker_notebook_instance_lifecycle_configuration" "this" {
  count     = var.create && var.lifecycle_configuration.create ? 1 : 0
  name      = var.lifecycle_configuration.name
  on_create = var.lifecycle_configuration.on_create
  on_start  = var.lifecycle_configuration.on_start
}
