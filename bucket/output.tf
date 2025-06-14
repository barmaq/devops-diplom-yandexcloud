output "terraform_backend_access_key" {
  value = yandex_iam_service_account_static_access_key.sa-static-key.access_key
}

output "terraform_backend_secret_key" {
  value     = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  sensitive = true
}

