FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm
ENV LIBRARY_PATH=/usr/lib/gcc/x86_64-linux-gnu/11

RUN apt-get update && apt-get install -y \
    build-essential \
    gcc-10 \
    g++-10 \
    gfortran \
    libgfortran5 \
    libgfortran-11-dev \
    make \
    cmake \
    git \
    wget \
    curl \
    pkg-config \
    software-properties-common \
    libgsl-dev \
    libfftw3-dev \
    libcfitsio-dev \
    libboost-all-dev \
    libeigen3-dev \
    libopenmpi-dev \
    openmpi-bin \
    liblapack-dev \
    libblas-dev \
    libarmadillo-dev \
    python3 \
    python3-pip \
    python3-dev \
    python-is-python3 \
    && rm -rf /var/lib/apt/lists/*

ENV CC=gcc-10
ENV CXX=g++-10

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 100
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-10 100

WORKDIR /opt

COPY . /opt/CosmoBolognaLib

WORKDIR /opt/CosmoBolognaLib

ENV CXXFLAGS="-O3 -fopenmp -fPIC -fallow-argument-mismatch -Wno-error"
ENV CFLAGS="-O3 -fopenmp -fPIC"

CMD ["/bin/bash"]