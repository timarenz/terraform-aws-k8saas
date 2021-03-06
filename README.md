# terraform-aws-k8saas
This Terraform module can be used to deploy a self-contained Kubernetes cluster based in AWS based on EKS.
Self-contained means its running in its own VPC and should have no impact on existing environments.

## Input variables
| Name | Decription | Type | Default | Required |
| ---- | ---------- | ---- | ------- | -------- |
| name | Used as name / prefix for all supported object names | string | - | yes |
| worker_count | Number of Kubernetes nodes required | string | 1 | no |
| tshirt_size | Size of the worker nodes, see below for more details | string | s | no |

### T-Shirt sizes
This variable is used to abstracht the complexity of AWS instances and allow to choose the number of vCPU and amount of memory required by a simple tshirt size.

| Size | vCPUs | Memory |
| ---- | ----- | ------ |
| S | 1 | 2GB |
| M | 2 | 4GB |
| L | 4 | 8GB |

## Output variables
| Name | Decription |
| ---- | ---------- |
| kube_config | Pre-configured kube config file to connect to the cluster. |
| cluster_api_url | URL to connect to the Kubernetes cluster API |

## Example
```hcl
module "terraform-aws-k8saas" {
  source        = "github.com/timarenz/terraform-aws-k8saas"
  name          = "tims-cluster"
  worker_count  = 3
  tshirt_size   = "m"
}
```

## Authors
Created and maintaned by [Tim Arenz](https://github.com/timarenz)

## License
[MIT](LICENSE)