kubectl --kubeconfig output/config -n=dev scale deployment a-micro --replicas=13
kubectl --kubeconfig output/config -n=dev scale deployment b-micro --replicas=5
kubectl --kubeconfig output/config -n=dev scale deployment c-micro --replicas=9

