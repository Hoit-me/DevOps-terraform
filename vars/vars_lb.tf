variable "lb_variables" {
  default = {

    target_group_slow_start = {
      dev = 0
      #   prod = 0
    }

    target_group_deregistration_delay = {
      dev = 60
      #   prod = 60
    }

    external_lb = {
      tags = {
        dev = {
          Name    = "dev_apnortheast2-external-lb"
          app     = "hoit"
          project = "hoit"
          env     = "dev"
          stack   = "dev_apnortheast2"
        },
        # prod = {
        # Name    = "dev_apnortheast2-external-lb"
        #   app     = "api-server"
        #   project = "hoit"
        #   env     = "prod"
        #   stack   = "prod_apnortheast2"
        # },
      }
    }

    external_lb_tg = {
      tags = {
        dev = {
          medicine_search_server = {
            Name    = "medicine-search-server-dev_apnortheast2-external-tg"
            app     = "hoit"
            project = "hoit"
            env     = "dev"
            stack   = "dev_apnortheast2"
          },
        },
        # prod = {
        #   Name    = "api-server-prod_apnortheast2-external-tg"
        #   app     = "api-server"
        #   project = "hoit"
        #   env     = "prod"
        #   stack   = "prod_apnortheast2"
        # },
      }
    }
  }
}

variable "ext_lb_ingress_cidrs" {
  default = ["0.0.0.0/0"]
}

variable "domain_name" {
  default = "ho-it.me"
}

variable "github_hook_sg_ipv4_cidrs" {
  description = ""
  default = [
    "192.30.252.0/22",
    "185.199.108.0/22",
    "140.82.112.0/20",
    "143.55.64.0/20",

  ]
}

variable "github_hook_sg_ipv6_cidrs" {
  description = ""
  default = [
    "2a0a:a440::/29",
    "2606:50c0::/32"
  ]
}
