# Port Office

Office worker for Dockers.

## Purpose

To create instantly respawnable containers that can withstand production environments.
## Docker Image Tagging Convention

This script generates Docker image tags based on the directory structure of Dockerfiles, specifically designed for a hierarchical directory structure.

### Tagging Rules

1. **Base Directory**: Directories named `base` are considered the root for base images. Dockerfiles within subdirectories of `base` are treated as base images.

2. **Image Tag Format**: Docker images are tagged based on their directory paths. The tag format is: `username/dir1-dir2:dir3`, where:
   - `dir1`: App name of the top-level directory set.
   - `dir2`: Additional info of the dir1 to dir3.
   - `dir3`: Mainly set the version.

3. **Path Simplification**: The `Dockerfile` path in `docker-bake.hcl` is simplified to exclude the first two directory names, enhancing readability.

```
./bubbles-out.sh
cat docker-bake.hcl
```

4. **Dependency Management on CICD**: Dependencies for non-base images are set based on the presence of `alpine` or `debian` in the Dockerfile's path, linking each image to its relevant base image.

5. **Target Groups**: A `default` group, including all targets, is generated in `docker-bake.hcl`, allowing single-command building of all images.

### Example

Given a directory structure:

```

├── base
│ ├── alpine
│ │ └── v1.0 (-> coelaoss/base-alpine:v1)
│ │   └── Dockerfile
│ └── debian
│   └── v1.0
│     └── Dockerfile
└── app
  ├── service1
  │ └── v1.0
  │   └── Dockerfile
  └── service2
    └── v1.0
      └── Dockerfile
```

