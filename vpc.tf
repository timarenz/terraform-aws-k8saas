variable "subnets" {
  type    = "list"
  default = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
}

data "aws_availability_zones" "available" {}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name   = "eks-${var.name}"

  cidr = "192.168.0.0/16"

  azs            = "${data.aws_availability_zones.available.names}"
  public_subnets = "${slice(var.subnets, 0, length(data.aws_availability_zones.available.names))}"

  public_subnet_tags = {
    "kubernetes.io/cluster/eks-${var.name}" = "shared"
  }

  vpc_tags = {
    "kubernetes.io/cluster/eks-${var.name}" = "shared"
  }
}
