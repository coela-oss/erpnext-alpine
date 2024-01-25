FROM python:3.11.7-alpine3.18

# Note: insufficient dependency of pipx and vertual environment
ENV PATH=/usr/local/bin:$PATH
RUN apk add --no-cache \
  nodejs \
  npm \
  python3 \
  py3-pip \
  python3-dev \
  gcc \
  linux-headers \
  musl-dev \
  git \
  && pip3 install \
  virtualenv \
  pipx
