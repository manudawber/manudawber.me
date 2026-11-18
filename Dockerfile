FROM nginxinc/nginx-unprivileged:1.27-alpine-slim

# Replace default server block with hardened port 8080 + /healthz config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy static site assets with world-readable permissions for uid 101
COPY --chmod=0644 index.html /usr/share/nginx/html/index.html

EXPOSE 8080

USER 101:101
