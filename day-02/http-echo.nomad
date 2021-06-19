job "http-echo" {
  datacenters = ["linuxtips"]
  group "giropops" {
    count = 3
    task "girus" {
      driver = "docker"
      config {
        image = "hashicorp/http-echo:latest"
        args = [
          "-listen", ":${NOMAD_PORT_http}",
          "-text", "Essa é a task ${NOMAD_TASK_NAME} da Giropops App que está sendo executado no IP ${NOMAD_IP_http} rodando na porta ${NOMAD_PORT_http}.",  
        ]  
      }

      resources {
        network {
          mbits = 100
          port "http" {}
        }
      }
      service {
        name = "http-echo"
        port = "http"
        tags = [
          "urlprefix-/http-echo",
        ]
        check {
          type = "http"
          path = "/health"
          interval = "5s"
          timeout = "5s"
        }
      }

    }  
  }


}