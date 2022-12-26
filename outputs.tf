output "certificate_arn" {
  description = "The ARN of the certificate"
  value       = try(aws_acm_certificate_validation.this[0].certificate_arn, aws_acm_certificate.this[0].arn, "")
}

# It's a bad idea, by default, AWS provider use only ARN,
# this is added for the individual case, use ARN, please :)
output "certificate_id" {
  description = "The ID of the certificate"
  value       = split("/", aws_acm_certificate.this[0].id)[1]
}

output "validation_records" {
  description = "The validation records list"
  value       = var.dns_provider == "NONE" || var.always_output_validate_records_list ? local.validation_records_list : []
}
