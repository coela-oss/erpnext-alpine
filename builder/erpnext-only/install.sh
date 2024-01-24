#!/bin/bash

docker run -p 8000:8000 -p 9000:9000 coelaoss/bench-erpnext:latest &
docker exec coelaoss/bench-erpnext:latest \
  new-site --no-mariadb-socket --admin-password=changeit --db-root-password=changeit --install-app erpnext --set-default localhost
