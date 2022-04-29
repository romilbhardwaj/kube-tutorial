# 02 - Setting up Kubernetes

We will use Kind (Kubernetes in Docker) to set up a Kubernetes cluster.

1. Use kind to create a cluster
   ```
   kind create cluster
   ```
   The output should look like
   ```bash
   (base) root@7f251c104577:/kube-tutorial/02_k8s_setup# kind create cluster 
   Creating cluster "kind" ...
    ✓ Ensuring node image (kindest/node:v1.23.4) 🖼 
    ✓ Preparing nodes 📦  
    ✓ Writing configuration 📜 
    ✓ Starting control-plane 🕹️ 
    ✓ Installing CNI 🔌 
    ✓ Installing StorageClass 💾 
   Set kubectl context to "kind-kind"
   ```
 
2. Kind automatically configures your kubectl to use the newly created kubernetes cluster. We can check if our Kubernetes cluster by fetching the nodes in the cluster:
   ```console
   (base) root@docker-desktop:/kube-tutorial/02_k8s_setup# kubectl get nodes
   NAME                 STATUS   ROLES                  AGE   VERSION
   kind-control-plane   Ready    control-plane,master   26s   v1.23.4
   ```

3. All objects (Pods, Jobs, Deployments, Auth Permissions, Secrets etc.) in Kubernetes are created using YAMLs. We will now deploy an example YAML which deploys the Kuberenetes Dashboard app. The dashboard is a useful webapp that gives us a GUI to explore our cluster.
   ```console
   (base) root@docker-desktop:/kube-tutorial/02_k8s_setup# kubectl apply -f dashboard.yaml
   namespace/kubernetes-dashboard created
   serviceaccount/kubernetes-dashboard created
   service/kubernetes-dashboard created
   secret/kubernetes-dashboard-certs created
   secret/kubernetes-dashboard-csrf created
   secret/kubernetes-dashboard-key-holder created
   configmap/kubernetes-dashboard-settings created
   role.rbac.authorization.k8s.io/kubernetes-dashboard created
   clusterrole.rbac.authorization.k8s.io/kubernetes-dashboard created
   rolebinding.rbac.authorization.k8s.io/kubernetes-dashboard created
   clusterrolebinding.rbac.authorization.k8s.io/kubernetes-dashboard created
   deployment.apps/kubernetes-dashboard created
   service/dashboard-metrics-scraper created
   deployment.apps/dashboard-metrics-scraper created
   ```
   
4. To access the dashboard, run `kubectl proxy`, and then open
   ```console
   http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/deployment?namespace=_all
   ```
   
   Press `skip` on the webpage to login.

   ![KubernetesDashboard](https://i.imgur.com/Ta766ZR.png)
