#!/bin/bash

# Update Game
./steamcmd.sh +force_install_dir "./${INSTALL_DIR}" +login anonymous +app_update "${GAME_ID}" +quit
cd "${INSTALL_DIR}" || exit 50

# Server Config
if [ "${INSTALL_DIR}" = "l4d2" ]; then
    CONFIG_DIR="left4dead2/cfg"
elif [ "${INSTALL_DIR}" = "l4d" ]; then
    CONFIG_DIR="left4dead/cfg"
else
  exit 100
fi
CONFIG_FILE="${CONFIG_DIR}/server.cfg"
rm -f ${CONFIG_DIR}/server.cfg
rm -f ${CONFIG_DIR}/server.cfg.tpl

cp -R /data/cfg/server.cfg.tpl ${INSTALL_DIR}/left4dead2/cfg/server.cfg.tpl
cp -R /data/cfg/server.cfg.tpl ${INSTALL_DIR}/left4dead2/cfg/server.cfg.tpl
cat /data/motd.txt > ${INSTALL_DIR}/left4dead2/motd.txt
cat /data/host.txt > ${INSTALL_DIR}/left4dead2/host.txt
if [ -f "${CONFIG_FILE}" ]; then
    echo "server.cfg already exists"
else
    cp "${CONFIG_DIR}/server.cfg.tpl" $CONFIG_FILE
    cat >> "${CONFIG_FILE}" <<EOF
hostname "${HOSTNAME}"
sv_region ${REGION}
sv_logecho 1
motd_enabled 1
EOF
    if [ -n "${RCON_PASSWORD}" ]; then
        echo "rcon_password \"${RCON_PASSWORD}\"" >> "${CONFIG_FILE}"
    fi
fi

rm -rf ${INSTALL_DIR}/left4dead2/addons/*
cp -R /data/addons/* ${INSTALL_DIR}/left4dead2/addons/
rm -rf ${INSTALL_DIR}/left4dead2/cfg/sourcemod
cp -R /data/cfg/sourcemod ${INSTALL_DIR}/left4dead2/cfg/

# Start Game
if [ $# -eq 0 ]; then
    ./srcds_run -port "${PORT}" +map "${MAP}" -maxplayers 8 +hostname "${HOSTNAME}" +hostip "${PUBLIC_IP}" -ip "${INTERNAL_IP}" +hostport "${PORT}" +clientport 27007 -nohltv +exec server.cfg -console

else
    ./srcds_run "$@"
fi

