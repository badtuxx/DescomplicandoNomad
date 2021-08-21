job "example" {
  datacenters = ["linuxtips","linuxtipsBR"]

  spread {
    attribute = "${node.datacenter}"
    weight = 100

    target "linuxtips" {
      percent = 80
    }
    
    target "linuxtipsBR" {
      percent = 20
    }

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
