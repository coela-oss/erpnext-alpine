# erpnext-alpine

Dockerfile built with Alpine that removes constraints for frappe user.
hwclock --hctosys
## Contents

For organizational purposes, this repository is divided into stages for each directory.

Use Frappe version 15 and will incorporate compatible apps as much as possible

### [base](https://hub.docker.com/r/coelaoss/frappe-base)

Common Linux modules and font modules for testing.

I plan to further optimize the fonts modules in the future.

### [bench](https://hub.docker.com/r/coelaoss/frappe-bench)

Generate an Image in which ```bench init```.

```
docker run coelaoss/frappe-bench:latest bench --help
```

### builder

Allow to perform the initial setup for each usage scenario.

#### [erpnext-only](https://hub.docker.com/r/coelaoss/erpnext-only)

Only ERPNext can be used mainly for environmental verification.

#### [enterprise-ready](https://hub.docker.com/r/coelaoss/erpnext-enterprise)

It is ready to install applications that may be necessary for business activities.

## Goals

To create lightweight, instantly respawnable containers that can withstand production environments.

## Tips

If you want to create your own image, please refer to the following commands and files.

```
./push-all.sh [docker hub username]
```

TODO: Use Github action.
