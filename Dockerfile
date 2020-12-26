FROM node:alpine

ENV WRANGLER_VERSION 1.12.3

RUN apk add --no-cache --virtual .build-deps \
        curl \
    && curl -fsSLO --compressed "https://github.com/cloudflare/wrangler/releases/download/v${WRANGLER_VERSION}/wrangler-v${WRANGLER_VERSION}-x86_64-unknown-linux-musl.tar.gz" \
    && tar -xf "wrangler-v${WRANGLER_VERSION}-x86_64-unknown-linux-musl.tar.gz" \
    && mv /dist/wrangler /usr/local/bin/wrangler \
    && rm -f "wrangler-v${WRANGLER_VERSION}-x86_64-unknown-linux-musl.tar.gz" \
    && apk del .build-deps

WORKDIR /opt

RUN wrangler init

ENTRYPOINT [ "wrangler" ]