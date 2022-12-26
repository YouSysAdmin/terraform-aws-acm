data "aws_route53_zone" "this" {
  count = local.create_certificate && var.dns_provider == "Route53" && var.validate_certificate ? 1 : 0
  name  = var.zone_name
  #private_zone = true
}

resource "aws_route53_record" "validation" {
  count = local.create_certificate && var.dns_provider == "Route53" && var.validate_certificate ? length(local.domain_names) : 0

  zone_id = data.aws_route53_zone.this[0].id
  name    = element(local.validation_records_list, count.index)["resource_record_name"]
  type    = element(local.validation_records_list, count.index)["resource_record_type"]
  ttl     = var.dns_ttl

  records = [
    element(local.validation_records_list, count.index)["resource_record_value"]
  ]

  allow_overwrite = var.validation_allow_overwrite_records

  depends_on = [aws_acm_certificate.this]
}