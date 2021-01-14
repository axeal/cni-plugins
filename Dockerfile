ARG ALPINE=alpine:3.12
FROM --platform=$BUILDPLATFORM ${ALPINE} AS download
ARG CNI_PLUGIN_RELEASE=v0.9.0
ARG TARGETARCH
WORKDIR /
RUN set -x \
 && apk --no-cache add curl \
 && curl -fsSL https://github.com/containernetworking/plugins/releases/download/${CNI_PLUGIN_RELEASE}/cni-plugins-linux-${TARGETARCH}-${CNI_PLUGIN_RELEASE}.tgz -o cni-plugins.tgz
FROM ${ALPINE}
COPY --from=download /cni-plugins.tgz /cni-plugins.tgz
