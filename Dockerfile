FROM amazonlinux:2 AS base

ARG GAME_ID=222860
ARG INSTALL_DIR="l4d2"
ARG SV_HOSTNAME="[DLR] Test server"
ARG REGION="255"
ARG PUBLIC_IP="0.0.0.0"
ARG DEFAULT_MAP="c2m1_highway"
ARG INTERNAL_IP="0.0.0.0"
ARG SV_PORT="27020"
ADD l4d2 /data

ADD as-root.sh .
RUN ./as-root.sh

WORKDIR /home/louis
USER louis

FROM base AS game
ADD as-user.sh .
RUN ./as-user.sh

EXPOSE 27020/tcp
EXPOSE 27020/udp

ENV MAP=$DEFAULT_MAP \
    PORT=$SV_PORT \
    HOSTNAME=$SV_HOSTNAME \
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
