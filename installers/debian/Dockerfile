FROM        --platform=$TARGETOS/$TARGETARCH debian:trixie-slim

LABEL       author="DIBSTER" maintainer="me@dibster.dev"

ENV         DEBIAN_FRONTEND=noninteractive

RUN         dpkg --add-architecture i386 \
            && apt-get update \
            && apt-get install -y --no-install-recommends \
                ca-certificates \
                curl \
                git \
                wget \
                tar \
                unzip \
                lib32gcc-s1 \
                libsdl2-2.0-0:i386 \
            && apt-get clean \
            && rm -rf /var/lib/apt/lists/*

WORKDIR     /mnt/server

CMD         ["/bin/bash"]