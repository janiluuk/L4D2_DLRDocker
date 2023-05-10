#!/bin/bash

#envsubst < /home/appuser/server.cfg.tpl > /home/appuser/l4d2server/left4dead2/cfg/server.cfg

/home/appuser/steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/appuser/l4d2server +app_update 222860 validate +quit

/home/appuser/l4d2server/srcds_run \
  -console \
  -game left4dead2 \
  -strictportbind \
  -hostip "$SV_ADDRESS" \
  -ip 0.0.0.0 \
  +maxplayers 8 \
  +map "$MAP" \
  +hostport 27015 \
  -netconport 27505 \
  +clientport 27006 \
  -debug