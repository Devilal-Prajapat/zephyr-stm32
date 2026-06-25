FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Base dependencies
RUN apt update && apt install -y \
    build-essential gcc g++ gdb make curl zip unzip vim nano sudo perl\
    git cmake ninja-build gperf \
    ccache dfu-util device-tree-compiler wget \
    python3-dev python3-venv python3-pip python3-tk \
    xz-utils file make gcc gcc-multilib g++-multilib libsdl2-dev libmagic1 \
    && rm -rf /var/lib/apt/lists/*

# Install West
# RUN pip3 install west --break-system-packages

# Python deps
RUN pip3 install -U pyelftools --break-system-packages

# -----------------------------
# Install Zephyr SDK (official)
# -----------------------------
ENV ZEPHYR_SDK_VERSION=1.0.1
# Environment variables for Zephyr SDK
ENV ZEPHYR_TOOLCHAIN_VARIANT=zephyr
ENV ZEPHYR_SDK_INSTALL_DIR=/opt/zephyr-sdk-${ZEPHYR_SDK_VERSION}


# # wget https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v1.0.1/zephyr-sdk-1.0.1_linux-x86_64_gnu.tar.xz
# # wget -O - https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v1.0.1/sha256.sum | shasum --check --ignore-missing

# wget  https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${ZEPHYR_SDK_VERSION}/zephyr-sdk-${ZEPHYR_SDK_VERSION}_linux-x86_64_minimal.tar.xz

# wget https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${ZEPHYR_SDK_VERSION}/hosttools_linux-x86_64.tar.xz

# wget https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${ZEPHYR_SDK_VERSION}/toolchain_gnu_linux-x86_64_arm-zephyr-eabi.tar.xz


# RUN mkdir -p /opt && \
#     cd /opt && \
#     wget -q https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${ZEPHYR_SDK_VERSION}/zephyr-sdk-${ZEPHYR_SDK_VERSION}_linux-x86_64_gnu.tar.xz && \
#     wget -O - https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${ZEPHYR_SDK_VERSION}/sha256.sum | shasum --check --ignore-missing && \
#     tar -xf zephyr-sdk-${ZEPHYR_SDK_VERSION}_linux-x86_64_gnu.tar.xz && \
#     mv zephyr-sdk-${ZEPHYR_SDK_VERSION} zephyr-sdk && \
#     rm zephyr-sdk-${ZEPHYR_SDK_VERSION}_linux-x86_64_gnu.tar.xz  && \
#     cd zephyr-sdk && \
#     ./setup.sh 
# # -t arm-zephyr-eabi -h -c


RUN mkdir -p /opt && \
    cd /opt  && \ 
    wget  https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${ZEPHYR_SDK_VERSION}/zephyr-sdk-${ZEPHYR_SDK_VERSION}_linux-x86_64_minimal.tar.xz && \
    wget https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${ZEPHYR_SDK_VERSION}/toolchain_gnu_linux-x86_64_arm-zephyr-eabi.tar.xz && \
    #wget https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${ZEPHYR_SDK_VERSION}/hosttools_linux-x86_64.tar.xz && \
    tar -xf zephyr-sdk-${ZEPHYR_SDK_VERSION}_linux-x86_64_minimal.tar.xz && \
    tar -xf toolchain_gnu_linux-x86_64_arm-zephyr-eabi.tar.xz && \
    mkdir -p zephyr-sdk-${ZEPHYR_SDK_VERSION}/gnu/arm-zephyr-eabi && \
    mv arm-zephyr-eabi zephyr-sdk-${ZEPHYR_SDK_VERSION}/gnu/ && \
    #rm -rf arm-zephyr-eabi && \
    rm zephyr-sdk-${ZEPHYR_SDK_VERSION}_linux-x86_64_minimal.tar.xz  && \
    rm toolchain_gnu_linux-x86_64_arm-zephyr-eabi.tar.xz && \
    cd zephyr-sdk-${ZEPHYR_SDK_VERSION} && \
    ./setup.sh -h -c

# RUN  cp /opt/zephyr-sdk-${ZEPHYR_SDK_VERSION}/hosttools/sysroots/x86_64-pokysdk-linux/usr/share/openocd/contrib/60-openocd.rules /etc/udev/rules.d
# RUN  sudo udevadm control --reload


RUN useradd -ms /bin/bash vscode \
    && echo "vscode ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER vscode
WORKDIR /workspace


# RUN cd /workspace
# RUN west init zephyrproject
# RUN cd zephyrproject
# RUN west update
# RUN west zephyr-export
# RUN west packages pip --install

# COPY docker/entrypoint.sh /entrypoint.sh
# RUN chmod +x /entrypoint.sh

# ENTRYPOINT ["/entrypoint.sh"]
# CMD ["bash"]
