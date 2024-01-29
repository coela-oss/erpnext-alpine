FROM debian:bookworm-slim

ENV VERSION=v3.0.0-beta5
ENV ARCH=amd64

RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates wget \
  && wget --quiet -O /tmp/traefik.tar.gz \
  "https://github.com/traefik/traefik/releases/download/${VERSION}/traefik_${VERSION}_linux_${ARCH}.tar.gz" \
  && tar xzvf /tmp/traefik.tar.gz -C /usr/local/bin traefik \
  && rm -f /tmp/traefik.tar.gz \
  && chmod +x /usr/local/bin/traefik \
  && mkdir -p /etc/traefik/dynamic \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && chmod -R +rw /etc/traefik 

EXPOSE 80
WORKDIR /etc/traefik
VOLUME ["/tmp", "/etc/traefik"]
ENTRYPOINT [ "traefik" ]
