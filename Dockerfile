FROM buildpack-deps:bookworm

ARG USER_NAME=yage-spec
ARG RUST_VERSION=1.90.0

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN set -eux && \
    apt-get update && \
    rm --force --recursive /var/lib/apt/lists/* && \
    useradd --create-home --shell /bin/bash $USER_NAME

USER $USER_NAME

RUN set -eux && \
    curl --silent --show-error --fail --tlsv1.3 --proto =https --location https://sh.rustup.rs \
    | bash -s -- -y --default-toolchain $RUST_VERSION && \
    source /home/$USER_NAME/.cargo/env && \
    cargo install aichat
