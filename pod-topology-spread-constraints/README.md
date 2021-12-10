## PreRequisite
- Terraform CLI
- AZ CLI
- kubectl

## Purpose and Structure

This example is for showcasing the usage of pod affinity and pod topology spread constraint to deploy resilient and efficient microservices in a Kubernetes cluster where node pool is spread across multiple zones

### iac

This directory contains Terraform files to provision an Azure Kubernetes Cluster in one region of Azure. The cluster will have a single node pool of 6 nodes spread across 3 zones. The VM type used is 'Standard_B2s' to keep the cost minimum.

### myapp

This directory contains deployment YAML of an example app with 3 dummy microservices using nginx images. Folder include two kinds of deployment topology

- Default topology - this contains deployment YAML with no specific constraint and use the default configuration on AKS cluster

- Custom topology - this contains deployment YAML with pod affinity and pod topology spread constraint to make sure services are being deployed in a resilient and efficient manner spread across zones and nodes.

### Scenarios

This directory contains bash files for executing the following scenarios

- 1. scale number of replicas equal to nodes for each microservice
- 2. scale number of replicas lower than number of nodes for each microservice
- 3. scale number of replicas higher than number of nodes for each microservice
- 4. scale higher number of replicas for a microservice than other microservice. For e.g. c-micro have higher number of replicas than a-micro and b-micro

## Steps to Run

- install the prerequisites listed above
- clone only the folder 'pod-topology-spread-constraints' from examples repo to your machine with following steps
  - git clone --no-checkout https://github.com/tanwarsatya/examples.git
  - cd examples
  - git sparse-checkout init --cone
  - git sparse-checkout set pod-topology-spread-constraints
  
- change directory to pod-topology-spread-constraints folder
- perform ***'az login'*** from the command prompt
- select the subscription with ***'az account set --subscription "XXXX-XXXXX-XXXX"'*** to deploy the AKS cluster
- run the bash script ***1_deploy_aks.sh*** to create AKS cluster, this will save the k8s config file inside ***output*** folder
- run the scenario you like to execute
  - bash scenarios/1_scale_equal_to_nodes.sh
  - bash scenarios/2_scale_lower_than_nodes.sh
  - bash scenarios/3_scale_higher_than_nodes.sh
  - bash scenarios/4_scale_dif_no_of_replicas_for_svc.sh

 
- clean the deployed azure resources by running ***bash 2_cleanup_resources.sh*** 
