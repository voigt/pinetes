# Machine-Controller-Manager


## Deploy MCM

```bash
# Deploy Custom Resources
$ kubectl apply -f deployments/kube-system/machine-controller/crds.yaml

# Create Roles + Rolebindings
$ kubectl apply -f deployments/kube-system/machine-controller/control-cluster-role-binding.yaml
$ kubectl apply -f deployments/kube-system/machine-controller/control-cluster-role.yaml
$ kubectl apply -f deployments/kube-system/machine-controller/target-cluster-role-binding.yaml
$ kubectl apply -f deployments/kube-system/machine-controller/target-cluster-role.yaml

# Create a kube-config containing just enough permissions for MCM.
$ kubectl create configmap mcm-config --from-file="config=~/.kube/config"

# Deploy MCM
$ kubectl apply -f deployments/kube-system/machine-controller/deployment.yaml
```

## Deploy Machine-Class