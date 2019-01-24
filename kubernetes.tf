module "eks" {
  source       = "terraform-aws-modules/eks/aws"
  cluster_name = "eks-${var.name}"
  subnets      = "${module.vpc.public_subnets}"
  vpc_id       = "${module.vpc.vpc_id}"

  # write_kubeconfig = false

  worker_groups = [
    {
      asg_desired_capacity = "${var.worker_count}"
      asg_max_size         = "${var.worker_count}"
      instance_type        = "${lookup(local.vm_tshirt_size, var.tshirt_size)}"
    },
  ]
}
