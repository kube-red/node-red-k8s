# Node-RED K8S

NodeRED K8s is a Node-RED container image that includes the Kube-RED nodes.

# Run

## Docker

```bash
docker run -it -v ~/.kube/config:/kube/config --env KUBECONFIG=/kube/config -v $(pwd)/kube-red:/data -p 1880:1880 ghcr.io/kube-red/node-red-k8s:latest
```

## Kubernetes

## Using Helm

By default, chart will deploy Kube-RED and give it `cluster-admin` role.

```bash
helm upgrade -i node-red-k8s charts/kube-red \
    --namespace kube-red \
    --create-namespace
```

### Kuberentes with [Faros](https://github.com/faroshq/faros-ingress)

Create faros connection resource

```bash
# login to faros
faros login
# create connection. You can use any hostname you want/need
faros connection create kube-red  --hostname kube-red --secure

Connection kube-red created
ID: 'b97c40fd-5222-469e-bfb4-a477f2f234e0'
Token: '55a022d3-1904-4151-aad6-xxxxxxxxx'
Hostname: 'https://kube-red.apps.faros.sh'
Username: 'faros'
Password: '83e72cd5-71b9-4eb7-bc93-xxxxxxxxx'
Token and username with password will be shown only once. Please save it now

```

Deploy kube-red with Faros ingress
```
helm upgrade -i node-red-k8s charts/kube-red \
    --namespace kube-red \
    --create-namespace \
    --set faros.enabled=true \
    --set faros.token='55a022d3-1904-4151-aad6-xxxxxxxxx' \
    --set faros.connection='b97c40fd-5222-469e-bfb4-xxxxxxxxx'
```
