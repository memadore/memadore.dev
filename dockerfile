FROM ghcr.io/gohugoio/hugo:v0.135.0 AS builder

WORKDIR /src
COPY . /src
RUN hugo --gc --minify

FROM nginx:alpine AS final
COPY --from=builder /src/public /usr/share/nginx/html
EXPOSE 80