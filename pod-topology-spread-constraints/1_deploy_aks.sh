cd iac
terraform init -input=false
terraform plan
terraform apply -input=false -auto-approve
mkdir -p ../output 
echo "saving .kubeconfig file to output/config.."
terraform output -raw kube_config > ../output/config
