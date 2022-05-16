FROM ubuntu:bionic

ENV CLANG_VERSION r450784e
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C

RUN apt update
RUN apt -y dist-upgrade
RUN apt -y install \
  bc \
  bison \
  build-essential \
  cpio \
  curl \
  flex \
  git \
  kmod \
  libacpi-dev \
  libfdt-dev \
  libncurses5 \
  libncurses-dev \
  libssl-dev \
  python \ 
  python3 \
  python3-pip \
  wget \
  xz-utils \
  zip

RUN git config --global --add safe.directory /src

RUN git clone \
  --depth=1 \
  https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9 \
  /opt/arm-linux-androideabi-4.9 \
  -b android12L-release

RUN git clone \
  --depth=1 \
  https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 \
  /opt/aarch64-linux-android-4.9 \
  -b android12L-release

RUN mkdir -p /opt/clang && \
  curl -L -o /var/tmp/clang.tar.gz https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+archive/refs/heads/master/clang-${CLANG_VERSION}.tgz && \
  tar -xvpf /var/tmp/clang.tar.gz -C /opt/clang && \
  rm -f /var/tmp/clang.tar.gz
  