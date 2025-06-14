# вынес сюда. даже с учетом долгого времени создания k8s кластера у меня не успел выпуститься сертификат.( буквально на vbyene )
# Создание DNS зоны для основного домена. указываем корневой домен!
# resource "yandex_dns_zone" "main_zone" {
#   name        = var.dns_zone_name
#   description = var.dns_zone_description
#   zone        = "${var.domain_name}."
#   public      = true
# }

# # Создание A-записи для поддомена app внутри основной зоны
# resource "yandex_dns_recordset" "app_record" {
#   zone_id = yandex_dns_zone.main_zone.id
#   name    = var.app_subdomain
#   type    = "A"
#   ttl     = var.dns_ttl
#   data    = [yandex_alb_load_balancer.app_alb.listener[0].endpoint[0].address[0].external_ipv4_address[0].address]
# }

# # Создание SSL сертификата
# resource "yandex_cm_certificate" "app_cert" {
#   # имя сертификата мы будем потом использовать в основном конфигурационном файле!
#   name    = "barmaq-app-cert"
#   domains = ["${var.app_subdomain}.${var.domain_name}"]

#   managed {
#     challenge_type = "DNS_CNAME"
#   }
# }

# # Создание CNAME записи для подтверждения SSL сертификата
# resource "yandex_dns_recordset" "cert_validation" {
#   zone_id = yandex_dns_zone.main_zone.id
#   name    = yandex_cm_certificate.app_cert.challenges[0].dns_name
#   type    = "CNAME"
#   ttl     = var.cert_validation_ttl
#   data    = [yandex_cm_certificate.app_cert.challenges[0].dns_value]
# }

# Создание DNS зоны для основного домена
resource "yandex_dns_zone" "main_zone" {
  name        = var.dns_zone_name
  description = var.dns_zone_description
  zone        = "${var.domain_name}."
  public      = true
}

# Создание SSL сертификата
resource "yandex_cm_certificate" "app_cert" {
  name    = "barmaq-dapp-cert"
  domains = ["${var.app_subdomain}.${var.domain_name}"]

  managed {
    challenge_type = "DNS_CNAME"
  }
}

# Создание CNAME записи для подтверждения SSL сертификата
resource "yandex_dns_recordset" "cert_validation" {
  zone_id = yandex_dns_zone.main_zone.id
  name    = yandex_cm_certificate.app_cert.challenges[0].dns_name
  type    = "CNAME"
  ttl     = var.cert_validation_ttl
  data    = [yandex_cm_certificate.app_cert.challenges[0].dns_value]
}

# Outputs для использования в основном проекте
output "certificate_id" {
  value = yandex_cm_certificate.app_cert.id
}

output "dns_zone_id" {
  value = yandex_dns_zone.main_zone.id
}