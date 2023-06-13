output "id" {
  description = "The name of the notebook instance"
  value       = try(aws_sagemaker_notebook_instance.this[0].id, null)
}

output "arn" {
  description = "The Amazon Resource Name (ARN) assigned by AWS to this notebook instance"
  value       = try(aws_sagemaker_notebook_instance.this[0].arn, null)
}

output "url" {
  description = "The URL that you use to connect to the Jupyter notebook that is running in your notebook instance"
  value       = try(aws_sagemaker_notebook_instance.this[0].url, null)
}

output "network_interface_id" {
  description = "The network interface ID that Amazon SageMaker created at the time of creating the instance"
  value       = try(aws_sagemaker_notebook_instance.this[0].network_interface_id, null)
}
