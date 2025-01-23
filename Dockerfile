FROM alpine:3.21

# Hugoのバージョン設定
ENV HUGO_VERSION='0.140.2'

# 使用するアーキテクチャに応じたHugoバイナリ名とURLを設定
RUN ARCH=$(uname -m) && \
    case "${ARCH}" in \
        x86_64) export HUGO_NAME="hugo_extended_${HUGO_VERSION}_Linux-64bit" ;; \
        arm64|aarch64) export HUGO_NAME="hugo_extended_${HUGO_VERSION}_Linux-ARM64" ;; \
        arm*) export HUGO_NAME="hugo_extended_${HUGO_VERSION}_Linux-ARM" ;; \
        *) echo "Unsupported architecture: ${ARCH}" && exit 1 ;; \
    esac && \
    echo "Hugo binary name set to: ${HUGO_NAME}"

ENV HUGO_BASE_URL="https://github.com/gohugoio/hugo/releases/download"
ENV HUGO_URL="${HUGO_BASE_URL}/v${HUGO_VERSION}/${HUGO_NAME}.tar.gz"
ENV HUGO_CHECKSUM_URL="${HUGO_BASE_URL}/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_checksums.txt"

WORKDIR /hugo
SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

RUN apk add --no-cache --virtual .build-deps wget && \
    apk add --no-cache \
    git \
    ca-certificates \
    libc6-compat \
    libstdc++ && \
    ARCH=$(uname -m) && \
    case "${ARCH}" in \
        x86_64) export HUGO_NAME="hugo_extended_${HUGO_VERSION}_Linux-64bit" ;; \
        arm64|aarch64) export HUGO_NAME="hugo_extended_${HUGO_VERSION}_Linux-ARM64" ;; \
        arm*) export HUGO_NAME="hugo_extended_${HUGO_VERSION}_Linux-ARM" ;; \
        *) echo "Unsupported architecture: ${ARCH}" && exit 1 ;; \
    esac && \
    wget --quiet "${HUGO_URL}" && \
    wget --quiet "${HUGO_CHECKSUM_URL}" && \
    grep "${HUGO_NAME}.tar.gz" "./hugo_${HUGO_VERSION}_checksums.txt" | sha256sum -c - && \
    tar -zxvf "${HUGO_NAME}.tar.gz" && \
    mv ./hugo /usr/bin/hugo && \
    apk del .build-deps && \
    rm -rf /hugo

WORKDIR /src
ENTRYPOINT [ "/usr/bin/hugo" ]
