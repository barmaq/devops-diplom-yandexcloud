###cloud vars

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
  default     = "b1g2678hn0b6tk45jj76"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
  default     = "b1gg0512n1fejb81t8f8"
}

#network
variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

# #=========
# # DNS configuration

variable "yc_zone" {
  description = "Yandex Cloud default zone"
  type        = string
  default     = "ru-central1-a"
}

variable "domain_name" {
  description = "Main domain name"
  type        = string
  default     = "barmaq.ru"
}

variable "app_subdomain" {
  description = "Application subdomain"
  type        = string
  default     = "app"
}

variable "dns_zone_name" {
  description = "DNS zone name"
  type        = string
  default     = "barmaq-ru"
}

variable "dns_zone_description" {
  description = "DNS zone description"
  type        = string
  default     = "DNS zone for barmaq.ru"
}

variable "dns_ttl" {
  description = "DNS record TTL"
  type        = number
  default     = 200
}

variable "cert_validation_ttl" {
  description = "Certificate validation CNAME record TTL"
  type        = number
  default     = 60
}
