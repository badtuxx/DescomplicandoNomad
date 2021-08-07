data_dir = "/opt/nomad/data"
bind_addr = "0.0.0.0"
datacenter = "linuxtips"
region = "amsterdam"

server {
  enabled = true
  bootstrap_expect = 3
}

client {
  enabled = false
}

consul {
  address             = "127.0.0.1:8500"
  server_service_name = "nomad"
  client_service_name = "nomad-client"
  auto_advertise      = true
  server_auto_join    = true
  client_auto_join    = true
}

vault {
  enabled = true
  address = "http://172.31.31.17:8200"
  task_token_ttl = "1h"
  create_from_role = "nomad-cluster"
  token = "s.V8xiTnIcSFpQAvkSqHyxQDQo"
}

acl {
  enabled = true
}
