# 05 - Autoscaling Spot clusters with EKS

Your best bet for using Kubernetes in the cloud is to use hosted services, such
as EKS/AKS/GKS. Not only do they simplify kubernetes deployments, they also offer
cool features like autoscaling and spot instances.

In this particular example, we will use EKS to create a managed autoscaling node group
of spot instances. What this means is, EKS will automatically add spot instances 
to your cluster if any pods are pending for some time, and it will use on-demand intsances
if spot instances are not available. More interestingly, if any spot instances fail,
 Kubernetes `Deployment` will handle recovery by relaunching pods that were on the failing
instances.

Complete the EKS autoscaling prequisites [here](https://docs.aws.amazon.com/eks/latest/userguide/autoscaling.html).

Setting this up is super simple (you need `eksctl` installed). Simply run
```
eksctl create cluster -f eks-spot.yaml --kubeconfig kubeconfig-eks.yaml
```

If you don't specify `--kubeconfig`, it will create a kubeconfig file in your home directory.
Your kubectl should be configured to use this cluster.

For more details, see [eksctl spot instances documentation](https://eksctl.io/usage/spot-instances/).

Now, we want to prioritize autoscaling the spot instances. We can do this by creating a
config map for the k8s autoscaler [expander](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/expander/priority/readme.md).
 
```
kubectl create -f autoscaler-spot-priority.yaml
```

That's it. Launch a workload, go crazy. EKS will prioritize using spot instances, 
and if it can't find any, it will use on-demand instances.
