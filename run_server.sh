#!/bin/bash

IMAGE_NAME="laredoo/minecraft-server:arm-64"

CURRENT_DIR=$(pwd)

docker run -v ${CURRENT_DIR}/minecraft/merge:/minecraft/merge \
           -v ${CURRENT_DIR}/minecraft/world:/minecraft/world \
           -v ${CURRENT_DIR}/minecraft/logs:/minecraft/logs \
           -p 25565:25565 \
           --name minecraft-server \
           ${IMAGE_NAME}