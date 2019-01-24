output "kube_config" {
  value = "${module.eks.kubeconfig}"
}

output "cluster_api_url" {
  value = "${module.eks.cluster_endpoint}"
}
