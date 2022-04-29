# Kubernetes for Grad Students
Kubernetes Tutorial for the PS2 group meetings at UC Berkeley.

Slides can be found [here](https://docs.google.com/presentation/d/16CEIbD7eISnzQGbtKfxGvRldutecqiGTwAi3VffOU5w/edit?usp=sharing).

![Dilbert on k8s](https://i.imgur.com/uOcM31v.jpg)

## Prerequisites
**Linux users** - you only need [docker installed](https://docs.docker.com/engine/install/). You can then use the tutorial docker image: 
```console
# Make sure you're logged in to DockerHub
docker login

# Run docker image for the tutorial
./run_tutorial.sh
```
If you do not wish to use the container, see instructions below.

**Mac/WSL/Linux users** - Please install:
1. Docker ([Mac](https://docs.docker.com/desktop/mac/install/) / [Windows](https://docs.docker.com/desktop/windows/install/)). After installation:
   ```console
   # Make sure you're logged in to DockerHub
   docker login
   ```

3. [Kind](https://kind.sigs.k8s.io/docs/user/quick-start/) - utility that we use to run the Kubernetes cluster.
   ```
   # Linux/WSL
   curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.12.0/kind-linux-amd64
   chmod +x ./kind
   mv ./kind /usr/local/bin/kind
   ```
   ```
   # Mac
   brew install kind
   ```
4. [Kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl) - utility to interact with Kubernetes clusters.
   ```
   # Linux/WSL
   curl -LO https://dl.k8s.io/release/v1.23.0/bin/linux/amd64/kubectl
   chmod +x kubectl
   mv ./kubectl /usr/local/bin/kubectl
   
   kubectl version --client
   ```
   ```
   # Mac
   brew install kubectl
   ```
5. (Optional, but highly recommended) [Setup bash autocompletion for kubectl](https://kubernetes.io/docs/tasks/tools/included/optional-kubectl-configs-bash-linux/). This will save you countless copy-pastes.

If you would like to build your own images, please make sure you are signed into your DockerHub account by running `docker login`.
