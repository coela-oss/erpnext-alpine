FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:461.0.0-alpine

ENV PROVIDER=google
ENV TFR_VERION=0.8.24
ENV TFR_PLG_VERSION=4.59.0

RUN apk add --no-cache curl \
  && curl -LO "https://github.com/GoogleCloudPlatform/terraformer/releases/download/${TFR_VERION}/terraformer-${PROVIDER}-linux-amd64" \
  && chmod +x terraformer-${PROVIDER}-linux-amd64 \
  && mv terraformer-${PROVIDER}-linux-amd64 /usr/local/bin/terraformer \
  && curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh -o install-opentofu.sh \
  && chmod +x install-opentofu.sh \
  && ./install-opentofu.sh --install-method apk \
  && mkdir -p /root/.terraform.d/plugins/linux_amd64 \
  && curl -LO "https://releases.hashicorp.com/terraform-provider-google/${TFR_PLG_VERSION}/terraform-provider-google_${TFR_PLG_VERSION}_linux_amd64.zip" \
  && unzip terraform-provider-google_${TFR_PLG_VERSION}_linux_amd64.zip -d /root/.terraform.d/plugins/linux_amd64 \
  && rm install-opentofu.sh 

WORKDIR /workspace/default
VOLUME [ "/workspace/default" ]

CMD [ "sh" ]
