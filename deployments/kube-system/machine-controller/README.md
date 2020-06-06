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

```bash
$ kubectl create secret generic aws-secret \
    --from-literal="providerAccessKeyId=$(cat environment/aws/credentials | head -n 1)" \
    --from-literal="providerSecretAccessKey=$(cat environment/aws/credentials | head -n 2 | tail -n 1)" \
    --from-file="userData=deployments/kube-system/machine-controller/userdata" -oyaml | kubectl apply -f -
```

