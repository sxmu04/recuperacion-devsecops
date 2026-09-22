FROM node:24-alpine AS build

WORKDIR /app

COPY package*.json ./

RUN npm ci --omit=dev \
    && npm cache clean --force

COPY . .

FROM node:24-alpine AS runtime

ENV NODE_ENV=production

WORKDIR /app

COPY --from=build --chown=node:node /app ./

# npm solo se necesita para instalar las dependencias.
# La aplicación se ejecuta directamente con Node.
RUN rm -rf /usr/local/lib/node_modules/npm \
    /usr/local/bin/npm \
    /usr/local/bin/npx

USER node

EXPOSE 8080

CMD ["node", "index.js"]