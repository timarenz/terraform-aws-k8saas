variable "name" {}

variable "worker_count" {
  default = 1
}

variable "tshirt_size" {
  default = "s"
}

locals {
  vm_tshirt_size = {
    s = "t2.small"
    m = "t2.medium"
    l = "c5.xlarge"
  }
}
