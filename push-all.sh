#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Need docker hub user name."
  exit 1
fi
user=$1

base=$user/frappe-base
bench=$user/frappe-bench
erpnext=$user/erpnext-only
enterprise=$user/erpnext-enterprise

docker stop $(docker ps -a -q)
docker rmi -f $(docker images -a -q)

docker build -t $base:latest -f base/Containerfile base --no-cache
docker push $base:latest
docker build -t $bench:latest -f bench/Containerfile bench --no-cache
docker push $bench:latest
docker build -t $erpnext:latest -f builder/erpnext-only/Containerfile builder/erpnext-only --no-cache
docker push $erpnext:latest
docker build -t $enterprise:latest -f builder/enterprise-ready/Containerfile builder/enterprise-ready --no-cache
docker push $enterprise:latest
