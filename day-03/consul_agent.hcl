datacenter = "linuxtips"
data_dir = "/opt/consul"

client_addr = "0.0.0.0"
ui_config{
  enabled = false
}

server = false
bind_addr = "0.0.0.0" # Listen on all IPv4
#advertise_addr = "0.0.0.0"
start_join = ["IP_CONSUL_NODE_1", "IP_CONSUL_NODE_2", "IP_CONSUL_NODE_3"]