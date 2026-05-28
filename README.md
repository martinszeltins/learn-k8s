# Learn Kubernetes

app/client - Nuxt app
app/server - Laravel app

Docker setup to use non-root user (1000:1000) to avoid permission issues when running containers in Kubernetes with non-root user later!


## Production Deployment

### 1. Build images

```sh
bin/build-images
```

### 2. Configure

Edit `docker/k8s/client-deployment.yml`:
- Set `NUXT_PUBLIC_BACKEND_API_URL` (internal: `http://learn-k8s-server/api`)
- Set `NUXT_PUBLIC_BACKEND_PUBLIC_URL` (public: `http://api.learnk8s.com`)

### 3. Deploy

```sh
bin/deploy
```

### 4. DNS

Point in Cloudflare:
- `learnk8s.com` → your server IP
- `api.learnk8s.com` → your server IP

SSL mode: Flexible (Cloudflare terminates TLS).
