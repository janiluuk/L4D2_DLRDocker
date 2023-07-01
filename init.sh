#!/bin/bash
echo "Copying over addons and configs"
cd /home/louis/
rsync -arv /data/addons/ ./${INSTALL_DIR}/left4dead2/addons
rsync -arvz --delete /data/cfg/sourcemod/ ./${INSTALL_DIR}/left4dead2/cfg/sourcemod
rsync -arvz --delete /data/addons/sourcemod/plugins/ ./${INSTALL_DIR}/left4dead2/addons/sourcemod/plugins
cp /data/host.txt ./${INSTALL_DIR}/left4dead2/host.txt
cp /data/motd.txt ./${INSTALL_DIR}/left4dead2/motd.txt

./entrypoint.sh
