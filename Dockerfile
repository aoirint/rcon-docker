FROM ubuntu:focal

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        build-essential \
        cmake \
        check \
        libbsd-dev \
        libglib2.0-dev \
        git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ARG RCON_VERSION=e7e2d9bb21930d7e2b00f9b35effe1eee1ec5585

RUN git clone https://github.com/n0la/rcon.git /opt/rcon && \
    cd /opt/rcon && \
    git checkout "${RCON_VERSION}" && \
    mkdir build && \
    cd build && \
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr && \
    make && \
    make install && \
    rm -rf /opt/rcon
