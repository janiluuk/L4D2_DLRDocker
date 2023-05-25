#!/bin/bash
docker build -t janiluuk/l4d2dlr:latest \
  --build-arg GAME_ID=222840 \
  --build-arg INSTALL_DIR="l4d2" \
  .