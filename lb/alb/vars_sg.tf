variable "sg_variables" {
  default = {

    ecr = {
      tags = {
        dev = {
          Name    = "dev_apnortheast2-ecr-sg"
          app     = "hoit"
          project = "hoit"
          env     = "dev"
          stack   = "dev_apnortheast2"
        },
        #prod 추가
      }
    }

    external_lb = {
      tags = {
        dev = {
          Name    = "alb-dev_apnortheast2-external-lb-sg"
          app     = "alb"
          project = "hoit"
          env     = "dev"
          stack   = "dev_apnortheast2"
        },
      }
    }
  }
}
