job "LINUXtips" {
  datacenters = ["dc1"]
  type = "service"

  group "cache" {
    count = 5
    network {
      port "db" {
        to = 6379
      }
    }
    service {
      name = "redis-cache"
      tags = ["global", "cache"]
      port = "db"
    }
    task "redis" {
      driver = "docker"
      config {
        image = "redis:3.2"
        ports = ["db"]
      }
    }
  }
}