resource "kubernetes_deployment" "example" {
  metadata {
    name = "terraform-deploy"
    labels = {
      test = "deploy-app"
    }
  }

  spec {
    replicas = 5

    selector {
      match_labels = {
        test = "deploy-app"
      }
    }

    template {
      metadata {
        labels = {
          test = "deploy-app"
        }
      }

      spec {
        container {
          image = "nginx:1.7.8"
          name  = "wave-app"
        }
      }
    }
  }
}

resource "kubernetes_service" "example" {
  metadata {
    name = "deploy-app"
  }
  spec {
    selector = {
      test = "deploy-app"
    }
    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}