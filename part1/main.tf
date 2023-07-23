# based on the "interactive lab" here: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/infrastructure-as-code
#   https://registry.terraform.io/providers/kreuzwerker/docker/3.0.2/docs/resources/image

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

variable image_name {
  type = string
  description = "name of Docker image to use"
  #default = "nginx:latest"
}

variable command {
  type = list(string)
  description = "command to run in container"
  default = ["bash", "-c", "echo 'sleeping for 5 min...' && sleep 5m"]
}


resource "docker_image" "this" {
  name         = var.image_name
  keep_locally = false
}

resource "docker_container" "this" {
  image = docker_image.this.image_id
  name  = "tutorial"
  command = var.command
  ports {
    internal = 80
    external = 8000
  }
}

output "container_name" {
    value = docker_container.this.name
}

output "inspect" {
    value = "docker inspect ${docker_container.this.name}"
    description = "command to get more info about the running docker container."
}