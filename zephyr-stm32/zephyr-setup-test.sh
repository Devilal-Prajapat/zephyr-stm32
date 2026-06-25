#! /bin/bash

ZEPHYR_SDK_VERSION=1.0.1
# Environment variables for Zephyr SDK
ZEPHYR_TOOLCHAIN_VARIANT=zephyr
ZEPHYR_SDK_INSTALL_DIR=/opt/zephyr-sdk-${ZEPHYR_SDK_VERSION}

## 

# echo https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${ZEPHYR_SDK_VERSION}/zephyr-sdk-${ZEPHYR_SDK_VERSION}_linux-x86_64_gnu.tar.xz
echo https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${ZEPHYR_SDK_VERSION}/zephyr-sdk-${ZEPHYR_SDK_VERSION}_linux-x86_64_minimal.tar.xz
wget  https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${ZEPHYR_SDK_VERSION}/zephyr-sdk-${ZEPHYR_SDK_VERSION}_linux-x86_64_minimal.tar.xz
wget https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${ZEPHYR_SDK_VERSION}/hosttools_linux-x86_64.tar.xz
wget https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${ZEPHYR_SDK_VERSION}/toolchain_gnu_linux-x86_64_arm-zephyr-eabi.tar.xz

tar -xf zephyr-sdk-${ZEPHYR_SDK_VERSION}_linux-x86_64_minimal.tar.xz
tar -xf toolchain_gnu_linux-x86_64_arm-zephyr-eabi.tar.xz
tar -xf hosttools_linux-x86_64.tar.xz