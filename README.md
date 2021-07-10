# eksctl demo

Provisioning an EKS cluster with managed nodes group and fargate profiles.

Create the VPC and subnets using [terraform](tf-eks-vpc) and update the config file [cluster-config.yml](cluster-config.yml)

```bash
$ eksctl create cluster -f  cluster-config --dry-run

$ eksctl create cluster -f  cluster-config.yml 

$ eksctl delete cluster --region=us-east-1 --name=eks-lab
```

