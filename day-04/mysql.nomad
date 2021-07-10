job "mysql" {
  datacenters = ["linuxtips"]
  type = "service"
  group "mysql" {
    count = 1
    network {
      port "db" {
        static = 3306
      }
    }
    volume "dados" { 
      type = "host"
      read_only = false
      source = "giropops"
    }

    task "mysql" {
      driver = "docker"
      volume_mount {
        volume = "dados"
        destination = "/var/lib/mysql"
        read_only = false
      } 
      env {
        MYSQL_ROOT_PASSWORD = "giropops"
      }
      config {
        image = "rberlind/mysql-demo:latest"
        ports = ["db"]
      }
      resources {
        cpu = 800
        memory = 1024
      }
      service {
        name = "mysql"
        port = "db"
        check {
          type = "tcp"
          interval = "3s"
          timeout = "2s"
        }
      }
    } 
  }
}
