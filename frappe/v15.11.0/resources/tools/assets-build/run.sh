#!/bin/sh

cd /home/frappe/sites \
  && args=$(paste -sd, - < /home/frappe/sites/apps.txt); \
  python -m frappe.utils.bench_helper frappe build --production --apps=$args
