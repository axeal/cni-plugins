# cni-plugins

Bundles [`containernetworking/plugins`](https://github.com/containernetworking/plugins/) CNI Plugins into a multi-arch alpine image. Designed for deploying required CNI Plugins to `/opt/cni/bin/` via an `initContainers` for those solutions (e.g. [`kube-router`](https://github.com/cloudnativelabs/kube-router)) that do not deploy CNI plugin dependencies by default.

```bash
CNI_PLUGIN_RELEASE=v0.9.0; docker buildx build -t axeal/cni-plugins:$CNI_PLUGIN_RELEASE --build-arg CNI_PLUGIN_RELEASE=$CNI_PLUGIN_RELEASE --push --platform=linux/amd64,linux/arm64 .
```
