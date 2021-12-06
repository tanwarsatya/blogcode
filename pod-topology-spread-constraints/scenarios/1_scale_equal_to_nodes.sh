kubectl --kubeconfig output/config -n=dev scale deployment a-micro --replicas=6
kubectl --kubeconfig output/config -n=dev scale deployment b-micro --replicas=6
kubectl --kubeconfig output/config -n=dev scale deployment c-micro --replicas=6

