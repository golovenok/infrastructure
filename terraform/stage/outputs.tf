output "app_external_ip_app" {
value = module.app.app_external_ip
}

output "app_external_ip_db" {
value = module.db.app_external_ip
}
