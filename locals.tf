locals {
  create_certificate = var.create_certificate

  domain_names = distinct(
    [for s in concat([var.domain_name], var.subject_alternative_names) : replace(s, "*.", "")]
  )

  validation_records_list = local.create_certificate ? distinct(
    [for k, v in try(aws_acm_certificate.this[0].domain_validation_options, {}) : merge(
      tomap(v), { domain_name = replace(v.domain_name, "*.", "") }
    )]
  ) : []
}