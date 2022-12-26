data "cloudflare_zone" "this" {
  count = local.create_certificate && var.dns_provider == "Cloudflare" && var.validate_certificate ? 1 : 0
  name  = var.zone_name
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

resource "cloudflare_record" "validation" {
  count = local.create_certificate && var.dns_provider == "Cloudflare" && var.validate_certificate ? length(local.domain_names) : 0

  zone_id = data.cloudflare_zone.this[0].id
  name    = element(local.validation_records_list, count.index)["resource_record_name"]
  type    = element(local.validation_records_list, count.index)["resource_record_type"]
  value   = trimsuffix(element(local.validation_records_list, count.index)["resource_record_value"], ".")
  ttl     = 60
  proxied = false

  allow_overwrite = var.validation_allow_overwrite_records
  depends_on      = [aws_acm_certificate.this]
}