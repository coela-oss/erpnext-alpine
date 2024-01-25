
target "base-alpine-v3_19-p3_11_7-n20" {
  context = "./base/alpine"
  dockerfile = "v3.19-p3.11.7-n20/Dockerfile"
  tags = ["coelaoss/base-alpine:v3.19-p3.11.7-n20"]
}
target "base-alpine-v3_19-p3_11_7-n18" {
  context = "./base/alpine"
  dockerfile = "v3.19-p3.11.7-n18/Dockerfile"
  tags = ["coelaoss/base-alpine:v3.19-p3.11.7-n18"]
}
target "base-alpine-v3_18-p3_11_7-n18" {
  context = "./base/alpine"
  dockerfile = "v3.18-p3.11.7-n18/Dockerfile"
  tags = ["coelaoss/base-alpine:v3.18-p3.11.7-n18"]
}
target "base-debian-bookworm-p3_11_7-n18" {
  context = "./base/debian"
  dockerfile = "bookworm-p3.11.7-n18/Dockerfile"
  tags = ["coelaoss/base-debian:bookworm-p3.11.7-n18"]
}
target "frappe-v15_11_0-alpine" {
  context = "./frappe/v15.11.0"
  dockerfile = "alpine/Dockerfile"
  tags = ["coelaoss/frappe-v15.11.0:alpine"]
  depends_on = ["base-alpine-v3_19-p3_11_7-n20","base-alpine-v3_19-p3_11_7-n18","base-alpine-v3_18-p3_11_7-n18"]
}
target "frappe-v15_11_0-debian" {
  context = "./frappe/v15.11.0"
  dockerfile = "debian/Dockerfile"
  tags = ["coelaoss/frappe-v15.11.0:debian"]
  depends_on = ["base-debian-bookworm-p3_11_7-n18"]
}
group "default" {
  targets = ["base-alpine-v3_19-p3_11_7-n20","base-alpine-v3_19-p3_11_7-n18","base-alpine-v3_18-p3_11_7-n18","base-debian-bookworm-p3_11_7-n18"]
}
group "apps" {
  targets = ["frappe-v15_11_0-alpine","frappe-v15_11_0-debian"]
}
