# Port Office

* Manage docker specification and dispach the hub.
* Enable faster setup with directory structure tagging and simple tools.

## Tagging Rules/Tools

### Image Tag Format
- Docker images are tagged based on their directory paths. The tag format is: `username/dir1-dir2:dir3`, where:
   - `dir1`: App name of the top-level directory set.
    - the ```base``` directory is a little special for depends on other directory.
   - `dir2`: Additional info of the dir1 to dir3.
   - `dir3`: Mainly set the version.

#### bubbles-out.sh
Build bake file script generates Docker image tags based on the directory structure of Dockerfiles, specifically designed for a hierarchical directory structure.

```
./bubbles-out.sh [docker hub username]
```

After exec the script. Bake file for Github Action out `bocker-bake.hcl` in same directory.

```
cat docker-bake.hcl
```

#### Example Structure

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
