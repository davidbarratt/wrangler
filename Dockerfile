FROM node:alpine

ENV WRANGLER_VERSION 1.12.3

RUN npm install -g @cloudflare/wrangler@${WRANGLER_VERSION}

WORKDIR /opt

ENTRYPOINT [ "wrangler" ]