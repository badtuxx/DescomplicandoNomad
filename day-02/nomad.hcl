# Full configuration options can be found at https://www.nomadproject.io/docs/configuration

data_dir = "/opt/nomad/data"
bind_addr = "0.0.0.0"
log_level = "DEBUG"
region = "amsterdam"
datacenter = "linuxtips"

server {
  enabled = true
  bootstrap_expect = 1
}

client {
  enabled = true
  servers = ["127.0.0.1:4646"]
}

advertise {
  http = "192.168.86.52"
  rpc  = "192.168.86.52"
  serf = "192.168.86.52:4648"
}
