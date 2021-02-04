FROM debian:buster AS builder
COPY build.sh /tmp/sasquatch/
COPY patches/ /tmp/sasquatch/patches/
RUN apt-get update \
 && apt-get install -y \
    build-essential \
    sudo \
    wget \
    liblzma-dev \
    liblzo2-dev \
    zlib1g-dev \
 && cd /tmp/sasquatch/ \
 && ./build.sh
FROM debian:buster
RUN apt-get update \
 && apt-get install -y \
    liblzo2-2 \
    liblzma5 \
    zlib1g
COPY --from=builder /usr/local/bin/sasquatch /usr/local/bin/sasquatch
ENTRYPOINT ["/usr/local/bin/sasquatch"]
