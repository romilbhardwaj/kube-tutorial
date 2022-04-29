# 04 - Autoscaling Spot clusters with EKS

Your best bet for using Kubernetes in the cloud is to use hosted services, such
as EKS/AKS/GKS. Not only do they simplify kubernetes deployments, they also offer
cool features like autoscaling and spot instances.

In this particular example, we will use EKS to create a managed autoscaling node group
of spot instances. What this means is, EKS will automatically add spot instances 
to your cluster if any pods are pending for some time, and it will use on-demand intsances
if spot instances are not available. More interestingly, if any spot instances fail,
 Kubernetes `Deployment` will handle recovery by relaunching pods that were on the failing
instances.

Setting this up is super simple (you need `eksctl` installed). Simply run
```
eksctl create cluster -f eks-spot.yaml
```

That's it. Your kubectl should be configured to use this cluster. Go crazy.

For more details, see [eksctl spot instances documentation](https://eksctl.io/usage/spot-instances/).
