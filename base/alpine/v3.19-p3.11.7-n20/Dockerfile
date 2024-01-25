FROM python:3.11.7-alpine3.19

ENV PATH=/root/.local/bin:$PATH
RUN apk add --no-cache \
  nodejs \
  npm \
  python3 \
  py3-pip \
  python3-dev \
  gcc \
  musl-dev \
  pipx \
  git \
  && pipx ensurepath \
  && pip3 install \
  virtualenv \
  psutil 
