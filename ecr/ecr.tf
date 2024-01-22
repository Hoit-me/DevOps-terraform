module "medicine_search_server" {
  source = "./_module"
  name   = "medicine-search-server"
}

output "medicine_search_server_ecr_url" {
  value = module.medicine_search_server.ecr_url
}
