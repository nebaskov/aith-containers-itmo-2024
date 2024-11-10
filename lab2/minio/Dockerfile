FROM quay.io/minio/mc

COPY ./create-bucket.sh /create-bucket.sh

RUN chmod +x /create-bucket.sh

VOLUME [ "/data" ]

WORKDIR /

ENTRYPOINT [ "/bin/bash", "-c", "/create-bucket.sh" ]