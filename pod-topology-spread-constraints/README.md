## PreRequisite
- Terraform CLI
- AZ CLI
- kubectl

## Purpose and Struture

This example is for showcasing the usage of pod affinity and pod topology spread constraint to deploy resilient and efficient microservices in a Kubernetes cluster where node pool is spread across multiple zones

### iac

This directory contains Terraform files to provision an Azure Kubernetes Cluster in one region of Azure. The cluster will have a single node pool of 6 nodes spread across 3 zones. The VM type used is 'Standard_B2s' to keep the cost minimum.

### myapp

This directory contains deployment yamls of an example app with 3 dummy microservices using nginx images. Folder include two kinds of deployment topology

- Default topology - this contains deployment yaml with no specific constraint and use the default configuration on AKS cluster

- Custom topology - this contains deployment yaml with pod affinity and pod topology spread constraint to make sure services are being deployed in a resilient and efficient manner spread across zones and nodes.

### Scenarios

This directory contains bash files for executing the following scenarios

- scale same number of replicas for each microservice
- scale different number of replicas for each microservice based on usage


## Steps to Run

- install the prerequisites listed above
- clone the examples repo to your machine
- once cloned to a local directory change to that directory
- change directory to pod-topology-spread-constraints folder
- perform ***'az login'*** from the command prompt
- select the subscription with ***'az account set --subscription "XXXX-XXXXX-XXXX"'*** to deploy the AKS cluster
- run the bash script ***1_deploy_aks.sh*** to create AKS cluster, this will save the k8s config file inside ***output*** folder
- deploy the ***myapp*** services to AKS (default or custom topology)
  -   kubectl --kubeconfig output/config apply -f myapp/default-topology.yaml
  -   kubectl --kubeconfig output/config apply -f myapp/custom-topology.yaml
- run different scaling scenarios for the ***myapp*** services
  -   kubectl --kubeconfig output/config apply -f scnarios/scale-same-numbers.yaml
  -   kubectl --kubeconfig output/config apply -f myapp/scale-different-numbers.yaml
- once done run bash file ***2_cleanup_resources.sh*** to remove the resources deployed in azure subscription
