FROM amazonlinux:2 AS base

ARG GAME_ID=222860
ARG INSTALL_DIR="l4d2"
ARG DEFAULT_MAP="c14m1_junkyard"
ARG PUBLIC_IP=""
ARG INTERNAL_IP="0.0.0.0"
ARG HOSTNAME="[DLR] Test server"
ARG REGION="255"

ADD l4d2 /data

ADD as-root.sh .
RUN ./as-root.sh

WORKDIR /home/louis
USER louis

FROM base AS game
ADD as-user.sh .
RUN ./as-user.sh

EXPOSE 27015/tcp
EXPOSE 27015/udp

ENV MAP=$DEFAULT_MAP \
    PORT=27015 \
    HOSTNAME=$HOSTNAME \
    REGION=$REGION \
    PUBLIC_IP=$PUBLIC_IP \
    INTERNAL_IP=$INTERNAL_IP \
    GAME_ID=$GAME_ID \
    INSTALL_DIR=$INSTALL_DIR

ADD entrypoint.sh entrypoint.sh
ENTRYPOINT ./entrypoint.sh

FROM game AS incremental
USER root
RUN yum -y update --security
USER louis
