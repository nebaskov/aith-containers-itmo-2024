#!/bin/bash

if [ ! -d "/data" ]; then
    mkdir /data
fi

mc alias set minioserver ${MINIO_URL} ${MINIO_ROOT_USER} ${MINIO_ROOT_PASSWORD}

mc mb --ignore-existing minioserver/aichem