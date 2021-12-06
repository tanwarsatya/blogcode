kubectl --kubeconfig output/config -n=dev scale deployment a-micro --replicas=9
kubectl --kubeconfig output/config -n=dev scale deployment b-micro --replicas=9
kubectl --kubeconfig output/config -n=dev scale deployment c-micro --replicas=9

