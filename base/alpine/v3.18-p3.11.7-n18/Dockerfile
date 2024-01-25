FROM python:3.11.7-alpine3.18

ENV PATH=/root/.local/bin:$PATH
RUN apk add --no-cache \
  nodejs \
  npm \
  python3 \
  py3-pip \
  python3-dev \
  gcc \
  musl-dev \
  git \
  && pip3 install virtualenv pipx
