# 03 - Porting to Kubernetes

Now that our app is containerized and our local kubernetes cluster is running, we can
start porting our app to kubernetes. There are two keys things we must do:

1. Define the application (Container image, number of replicas, etc.)
2. Define the networking for the application (how to connect to the application, ports etc.)

Let's start with the application. We will define it as a Kubernetes `Deployment`. A 
deployment is  a Kubernetes object that describes a group of pods that are created
together. `Deployment` is unique in that it always tries to achieve the declared
state of the pods. For intsance, if you say `replicas: 2`, the deployment will
 try to always have 2 pods running. If one of the pods dies, it will automatically
create a new one.

The `Deployment` is defined in the `myapp_deployment.yaml` file. Let's deploy it:
```console
kubectl apply -f myapp_deployment.yaml
```  

That's it, your deployment is running.

Now since we can't access it from outside the cluster (of course, you can set it up to be
accessible from outside but that's out of scope here), we will create a client that 
we will use to get inside the cluster and access the deployment.

Let's launch a client that sleeps and we will get a terminal inside it to mess around.

```console
kubectl apply -f myclient_deployment.yaml
kubectl get pods  # Copy the name of the myclient pod from here
kubectl exec -it <client_pod_name> /bin/bash
``` 

This will drop you inside a terminal. Now to access the myapp pod, we need its IP address.
Let's get it:

```console
kubectl describe pod <app_pod_name>
```

<TODO: Add service tutorial..> 
