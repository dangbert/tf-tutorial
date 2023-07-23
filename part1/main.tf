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

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial"
  ports {
    internal = 80
    external = 8888
  }
}