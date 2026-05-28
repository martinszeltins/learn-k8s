# Setup

## Deployment

### Install Kubernetes

```bash
sudo apt install -y curl ca-certificates git jq
curl -sfL https://get.k3s.io | sh -
sudo ufw allow 80/tcp && sudo ufw allow 443/tcp
sudo k3s kubectl get nodes && sudo k3s kubectl get pods -A
```

### Deploy app

```bash
bin/deploy
```

### Add hosts

```bash
echo '127.0.0.1 learnk8s.com api.learnk8s.com' | sudo tee -a /etc/hosts
```

### Open the app in browser

http://learnk8s.com
