FROM node:24-slim

RUN npm install -g pnpm@9

RUN pnpm config set store-dir /tmp/.pnpm-store

WORKDIR /app

ENV CI=true

EXPOSE 3000

CMD ["sh", "-c", "pnpm install && pnpm dev --host 0.0.0.0"]
