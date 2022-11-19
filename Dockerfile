FROM alpine:edge

ARG AUUID="2eedb22c-fe87-4173-8a36-ff2986be1ba4"
ARG CADDYIndexPage="https://github.com/happyevero/Html/raw/main/L-html.zip"
ARG ParameterSSENCYPT="chacha20-ietf-poly1305"
ARG PORT=80

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD deploy.sh /deploy.sh
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor unzip wget && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
