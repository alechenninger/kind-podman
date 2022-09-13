podman pull kubernetesui/dashboard-arm64:latest
podman save -o kubernetesui-dashboard-arm64.tar docker.io/kubernetesui/dashboard-arm64
echo "Use with kind load image-archive kubernetesui-dashboard-arm64.tar"
