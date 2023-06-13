variable "create" {
  description = "Controls if resources should be created (affects nearly all resources)"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

################################################################################
# SageMaker notebook instance
################################################################################
variable "name" {
  description = "The name of the notebook instance (must be unique)"
  type        = string
}

variable "role_arn" {
  description = "The ARN of the IAM role to be used by the notebook instance which allows SageMaker to call other services on your behalf"
  type        = string
}

variable "instance_type" {
  description = "The name of ML compute instance type"
  type        = string
}

variable "platform_identifier" {
  description = "The platform identifier of the notebook instance runtime environment. This value can be either notebook-al1-v1, notebook-al2-v1, or notebook-al2-v2"
  type        = string
  default     = null
}

variable "volume_size" {
  description = "The size, in GB, of the ML storage volume to attach to the notebook instance"
  type        = number
  default     = null
}

variable "subnet_id" {
  description = "The VPC subnet ID"
  type        = string
  default     = null
}

variable "security_groups" {
  description = "The associated security groups"
  type        = list(string)
  default     = null
}

variable "accelerator_types" {
  description = "A list of Elastic Inference (EI) instance types to associate with this notebook instance. Valid values: ml.eia1.medium, ml.eia1.large, ml.eia1.xlarge, ml.eia2.medium, ml.eia2.large, ml.eia2.xlarge"
  type        = list(string)
  default     = null
}

variable "accelerator_additional_code_repositoriestypes" {
  description = "An array of up to three Git repositories to associate with the notebook instance"
  type        = list(string)
  default     = null
}

variable "default_code_repository" {
  description = "The Git repository associated with the notebook instance as its default code repository"
  type        = string
  default     = null
}

variable "direct_internet_access" {
  description = "Set to false to disable internet access to notebook. Requires security_groups and subnet_id to be set"
  type        = bool
  default     = true
}

variable "instance_metadata_service_configuration" {
  description = "Information on the IMDS configuration of the notebook instance"
  type = object({
    enabled                                   = optional(bool, false)
    minimum_instance_metadata_service_version = optional(number) # Indicates the minimum IMDS version that the notebook instance supports
  })
  default = {
    enabled = false
  }
}

variable "kms_key_id" {
  description = "The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to encrypt the model artifacts at rest using Amazon S3 server-side encryption"
  type        = string
  default     = null
}

variable "root_access" {
  description = "Whether root access is enabled or disabled for users of the notebook instance"
  type        = bool
  default     = true
}

variable "lifecycle_configuration" {
  description = "Provides a lifecycle configuration for SageMaker Notebook Instances"
  type = object({
    enabled   = bool                  # Whether lifecycle configuration is enabled
    name      = string                # The name of the lifecycle configuration (must be unique)
    create    = optional(bool, false) # Whether to create lifecycle configuration or use existing
    on_create = optional(string)      # A shell script (base64-encoded) that runs only once when the SageMaker Notebook Instance is created. Applicable when create is true
    on_start  = optional(string)      # A shell script (base64-encoded) that runs every time the SageMaker Notebook Instance is started including the time its created. Applicable when create is true
  })
  default = {
    enabled = false
    name    = ""
  }
}
