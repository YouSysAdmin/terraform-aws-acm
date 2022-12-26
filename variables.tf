variable "zone_name" {
  description = "The name of the DNS zone."
  type        = string
  default     = ""
}

variable "domain_name" {
  description = "A domain name for which the certificate requesting"
  type        = string
  default     = ""
}

variable "cloudflare_api_token" {
  description = "The API Token for access to Cloudflare API."
  type        = string
  default     = "MgeSYkQCdn5R2xWWQVDenrexpKApvJW4SIXoOi1i" # just a stub
}

variable "dns_provider" {
  description = "DNS provider used for validation."
  type        = string
  default     = "Route53"

  validation {
    condition     = contains(["Route53", "Cloudflare", "NONE"], var.dns_provider)
    error_message = "Valid values are Route53, Cloudflare or NONE."
  }
}

variable "create_certificate" {
  description = "Create ACM certificate"
  type        = bool
  default     = true
}

variable "validate_certificate" {
  description = "Validate certificate by creating DNS records"
  type        = bool
  default     = true
}

variable "validation_allow_overwrite_records" {
  description = "Allow overwrite of DNS records"
  type        = bool
  default     = true
}

variable "validation_timeout" {
  description = "Maximum timeout to wait for the validation to complete"
  type        = string
  default     = null
}

variable "validation_method" {
  description = "Using validation method."
  type        = string
  default     = "DNS"

  validation {
    condition     = contains(["DNS"], var.validation_method)
    error_message = "Valid values are DNS, EMAIL method is not supported."
  }
}

variable "certificate_transparency_logging_preference" {
  description = "Specifies whether certificate details should be added to a certificate transparency log"
  type        = bool
  default     = true
}

variable "subject_alternative_names" {
  description = "A list of additional domains names in the issued certificate"
  type        = list(string)
  default     = []
}

variable "dns_ttl" {
  description = "TTL of DNS record."
  type        = number
  default     = 60
}

variable "key_algorithm" {
  description = "Specifies the algorithm of the public and private key pair that your Amazon issued certificate uses to encrypt data"
  type        = string
  default     = "RSA_2048"
  validation {
    condition     = contains(["RSA_2048", "EC_prime256v1", "EC_secp384r1"], var.key_algorithm)
    error_message = "Valid values are RSA_2048, EC_prime256v1, EC_secp384r1 or null."
  }
}

variable "always_output_validate_records_list" {
  description = "The TTL of DNS recursive resolvers to cache information about this record."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
