job "http-echo" {
  datacenters = ["linuxtips"]
  group "giropops" {
    count = 3
    task "girus" {
      driver = "docker"
      config {
        image = "hashicorp/http-echo:latest"
        args = [
          "-listen", ":8080",
          "-text", "O Giropops App está sendo executado no IP 127.0.0.1 rodando na porta 8080.",  
        ]  
      }

      resources {
        network {
          mbits = 100
          port "http" {
            static = 8080
          }
        }
      }

    }  
  }


}