cd iac
terraform init -input=false
terraform plan
terraform apply -input=false -auto-approve
terraform output -raw kube_config >> ../output/config
