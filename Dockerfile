FROM        --platform=$TARGETOS/$TARGETARCH erlang:24-alpine

LABEL       author="furryformula" maintainer=" "

LABEL       org.opencontainers.image.source="https://github.com/furryformula/RabbirMQ-EGG"
LABEL       org.opencontainers.image.licenses=MIT

RUN         apk add --update --no-cache ca-certificates curl git openssl sqlite tar tzdata \
				&& adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/ash", "/entrypoint.sh" ]
