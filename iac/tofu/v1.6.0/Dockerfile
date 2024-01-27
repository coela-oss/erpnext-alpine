FROM alpine:3.19

RUN apk add --no-cache curl \
  && curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh -o install-opentofu.sh \
  && chmod +x install-opentofu.sh \
  && ./install-opentofu.sh --install-method apk \
  && rm install-opentofu.sh

WORKDIR /workspace/default
VOLUME [ "/workspace" ]

CMD [ "tofu" ]
