# delete the existing app
kubectl --kubeconfig output/config delete -f myapp/custom.yaml
# install the myApp
kubectl --kubeconfig output/config apply -f myapp/custom.yaml
# scale the app
kubectl --kubeconfig output/config -n=dev scale deployment a-micro --replicas=3
kubectl --kubeconfig output/config -n=dev scale deployment b-micro --replicas=3
kubectl --kubeconfig output/config -n=dev scale deployment c-micro --replicas=3
