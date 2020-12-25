#!/bin/bash
set -x
set -e

export CADDYPATH=/data/caddy
export API_SERVER=${API_SERVER:-${API_DOMAIN_NAME}}
export API_URL=${API_URL:-https://${API_DOMAIN_NAME}}
export CADDY_TLS=${CADDY_TLS:-'tls contact@openindoor.io {
    ca ${CERTIFICATE_AUTHORITY}
}'}

env

cat  /etc/caddy/Caddyfile

mkdir -p /data/www
cat /tmp/index.html | envsubst | tee /data/www/index.html

caddy run --watch --config /etc/caddy/Caddyfile
