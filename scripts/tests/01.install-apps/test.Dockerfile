FROM coelaoss/base-alpine:v3.18-p3.11.7-n18

WORKDIR /home/frappe/
ENV PATH=/root/.local/bin:/root/.local/pipx/venvs/frappe/bin:$PATH

RUN /home/frappe/tools/apps/install.sh
