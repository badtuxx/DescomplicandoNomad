job "example" {
  datacenters = ["linuxtips","linuxtipsBR"]
  
  affinity {
    attribute = "${node.datacenter}"
    value = "linuxtipsBR"
    weight = 100
  }

  group "cache" {
    count = 10
    network {
      port "db" {
        to = 6379
      }
    }

    task "redis" {
      driver = "docker"

      config {
        image = "redis:3.2"

        ports = ["db"]
      }

      resources {
        cpu    = 500
        memory = 256
      }
    }
  }
}
