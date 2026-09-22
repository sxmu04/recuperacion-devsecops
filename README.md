# Recuperación DevSecOps

Proyecto de recuperación para contenerización y despliegue seguro de una API Node.js.

## Servicios

- API Node.js / Express
- Docker
- Docker Compose
- Nginx Proxy Manager
- Uptime Kuma
- Dozzle
- GitHub Actions
- Trivy
- AWS EC2
- DuckDNS
- Let's Encrypt
- Telegram

## API

Puerto interno:

8080

Rutas:

- /
- /datos
- /api/crash

## Seguridad

La API utiliza un usuario no privilegiado dentro del contenedor.

El pipeline ejecuta:

1. npm audit
2. construcción de imagen Docker
3. análisis Trivy
4. despliegue mediante SSH