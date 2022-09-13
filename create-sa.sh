kubectl create -f - <<EOF
apiVersion: v1
kind: ServiceAccount
metadata:
  name: sa1
EOF
kubectl create -f - <<EOF
apiVersion: v1
kind: Secret
metadata:
  name: sa1
  annotations:
    kubernetes.io/service-account.name: "sa1"
type: kubernetes.io/service-account-token
EOF
kubectl create -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
# This cluster role binding allows anyone in the "manager" group to read secrets in any namespace.
kind: ClusterRoleBinding
metadata:
  name: read-secrets-global
subjects:
- kind: ServiceAccount
  name: sa1
  namespace: default
roleRef:
  kind: ClusterRole
  name: cluster-admin
EOF
kubectl get secret/sa1 -o jsonpath='{.data.token}' | base64 -D | pbcopy
echo "Token in clipboard"
