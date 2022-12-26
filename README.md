# Terraform AWS ACM
Terraform module which creates ACM certificates and validates them using Route53 or Cloudflare as DNS provider.

[![SWUbanner](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/banner2-direct.svg)](https://github.com/vshymanskyy/StandWithUkraine/blob/main/docs/README.md)

## Attention
Supported only DNS method for validation, EMAIL is not supported.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.40 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | 3.30.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.40 |
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | 3.30.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_route53_record.validation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [cloudflare_record.validation](https://registry.terraform.io/providers/cloudflare/cloudflare/3.30.0/docs/resources/record) | resource |
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |
| [cloudflare_zone.this](https://registry.terraform.io/providers/cloudflare/cloudflare/3.30.0/docs/data-sources/zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_always_output_validate_records_list"></a> [always\_output\_validate\_records\_list](#input\_always\_output\_validate\_records\_list) | The TTL of DNS recursive resolvers to cache information about this record. | `bool` | `false` | no |
| <a name="input_certificate_transparency_logging_preference"></a> [certificate\_transparency\_logging\_preference](#input\_certificate\_transparency\_logging\_preference) | Specifies whether certificate details should be added to a certificate transparency log | `bool` | `true` | no |
| <a name="input_cloudflare_api_token"></a> [cloudflare\_api\_token](#input\_cloudflare\_api\_token) | The API Token for access to Cloudflare API. | `string` | `"MgeSYkQCdn5R2xWWQVDenrexpKApvJW4SIXoOi1i"` | no |
| <a name="input_create_certificate"></a> [create\_certificate](#input\_create\_certificate) | Create ACM certificate | `bool` | `true` | no |
| <a name="input_dns_provider"></a> [dns\_provider](#input\_dns\_provider) | DNS provider used for validation. | `string` | `"Route53"` | no |
| <a name="input_dns_ttl"></a> [dns\_ttl](#input\_dns\_ttl) | TTL of DNS record. | `number` | `60` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | A domain name for which the certificate requesting | `string` | `""` | no |
| <a name="input_key_algorithm"></a> [key\_algorithm](#input\_key\_algorithm) | Specifies the algorithm of the public and private key pair that your Amazon issued certificate uses to encrypt data | `string` | `"RSA_2048"` | no |
| <a name="input_subject_alternative_names"></a> [subject\_alternative\_names](#input\_subject\_alternative\_names) | A list of additional domains names in the issued certificate | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource | `map(string)` | `{}` | no |
| <a name="input_validate_certificate"></a> [validate\_certificate](#input\_validate\_certificate) | Validate certificate by creating DNS records | `bool` | `true` | no |
| <a name="input_validation_allow_overwrite_records"></a> [validation\_allow\_overwrite\_records](#input\_validation\_allow\_overwrite\_records) | Allow overwrite of DNS records | `bool` | `true` | no |
| <a name="input_validation_method"></a> [validation\_method](#input\_validation\_method) | Using validation method. | `string` | `"DNS"` | no |
| <a name="input_validation_timeout"></a> [validation\_timeout](#input\_validation\_timeout) | Maximum timeout to wait for the validation to complete | `string` | `null` | no |
| <a name="input_zone_name"></a> [zone\_name](#input\_zone\_name) | The name of the DNS zone. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificate_arn"></a> [certificate\_arn](#output\_certificate\_arn) | The ARN of the certificate |
| <a name="output_certificate_id"></a> [certificate\_id](#output\_certificate\_id) | The ID of the certificate |
| <a name="output_validation_records"></a> [validation\_records](#output\_validation\_records) | The validation records list |
<!-- END_TF_DOCS -->

## Authors

Module is maintained by [YouSysAdmin](https://github.com/yousysadmin).

## License

MIT Licensed. See [LICENSE](https://github.com/YouSysAdmin/terraform-aws-acm/tree/master/LICENSE.md) for full details.

## Additional information for users from Russia and Belarus

* Russia has [illegally annexed Crimea in 2014](https://en.wikipedia.org/wiki/Annexation_of_Crimea_by_the_Russian_Federation) and [brought the war in Donbas](https://en.wikipedia.org/wiki/War_in_Donbas) followed by [full-scale invasion of Ukraine in 2022](https://en.wikipedia.org/wiki/2022_Russian_invasion_of_Ukraine).
* Russia has brought sorrow and devastations to millions of Ukrainians, killed hundreds of innocent people, damaged thousands of buildings, and forced several million people to flee.
* [Putin khuylo!](https://en.wikipedia.org/wiki/Putin_khuylo!)