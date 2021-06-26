data_dir = "/opt/nomad/data"
bind_addr = "0.0.0.0"
datacenter = "linuxtips"
region = "amsterdam"

server {
  enabled = false
}

client {
  enabled = true
  options = {
    "driver.allowlist" = "docker,exec"
  }
}
consul {
  address             = "127.0.0.1:8500"
  server_service_name = "nomad"
  client_service_name = "nomad-client"
  auto_advertise      = true
  server_auto_join    = true
  client_auto_join    = true
}
