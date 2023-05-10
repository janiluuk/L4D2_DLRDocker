FROM debian:bullseye-slim as build_stage

# Default configurations
ARG DEFAULT_MAP="c14m1_junkyard"

ENV SV_HOSTNAME="L4D2 Server"
ENV SV_RCON_PASSWORD="changeme"
ENV SV_PORT=27015

ENV MAP=$DEFAULT_MAP
ENV USER=appuser
ENV HOMEDIR "/home/${USER}"
ENV STEAMCMDDIR "${HOMEDIR}/steamcmd"
ARG PUID=1000

ENV DEBIAN_FRONTEND noninteractive

EXPOSE 27015/tcp
EXPOSE 27015/udp

RUN set -x \
	# Install, update & upgrade packages
	&& apt-get update \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
		lib32stdc++6=10.2.1-6 \
		lib32gcc-s1=10.2.1-6 \
		ca-certificates=20210119 \
		nano=5.4-2+deb11u2 \
		curl=7.74.0-1.3+deb11u7 \
		locales=2.31-13+deb11u5 \
	&& sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
	&& dpkg-reconfigure --frontend=noninteractive locales \
	# Create unprivileged user
	&& useradd -u "${PUID}" -m "${USER}" \
	# Download SteamCMD, execute as user
	&& su "${USER}" -c \
		"mkdir -p \"${STEAMCMDDIR}\" \
		&& curl -fsSL 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz' | tar xvzf - -C \"${STEAMCMDDIR}\" \
		&& \"./${STEAMCMDDIR}/steamcmd.sh\" +quit \
		&& mkdir -p \"${HOMEDIR}/.steam/sdk32\" \
		&& ln -s \"${STEAMCMDDIR}/linux32/steamclient.so\" \"${HOMEDIR}/.steam/sdk32/steamclient.so\" \
		&& ln -s \"${STEAMCMDDIR}/linux32/steamcmd\" \"${STEAMCMDDIR}/linux32/steam\" \
		&& ln -s \"${STEAMCMDDIR}/steamcmd.sh\" \"${STEAMCMDDIR}/steam.sh\"" \
	# Symlink steamclient.so; So misconfigured dedicated servers can find it
	&& ln -s "${STEAMCMDDIR}/linux64/steamclient.so" "/usr/lib/x86_64-linux-gnu/steamclient.so" \
	# Clean up
	&& apt-get remove --purge --auto-remove -y \
	&& rm -rf /var/lib/apt/lists/*

FROM build_stage AS bullseye-root

RUN /home/appuser/steamcmd/steamcmd.sh +force_install_dir /home/appuser/l4d2server +quit \
  && mkdir -p /home/appuser/.steam/sdk32 \
  && /home/appuser/steamcmd/steamcmd.sh +force_install_dir /home/appuser/l4d2server +login anonymous +app_update 222860 validate +quit

WORKDIR ${STEAMCMDDIR}

# Install Competitive Rework

COPY --chown=appuser:appuser ./l4d2/addons /home/appuser/l4d2server/left4dead2/addons/
COPY --chown=appuser:appuser ./l4d2/cfg/server.cfg /home/appuser/l4d2server/left4dead2/cfg/server.cfg
COPY --chown=appuser:appuser ./l4d2/cfg/autoexec.cfg /home/appuser/l4d2server/left4dead2/cfg/autoexec.cfg
COPY --chown=appuser:appuser ./l4d2/cfg/sourcemod /home/appuser/l4d2server/left4dead2/cfg/sourcemod/

COPY --chown=appuser:appuser ./l4d2/host.txt /home/appuser/l4d2server/left4dead2/host.txt
COPY --chown=appuser:appuser ./l4d2/motd.txt /home/appuser/l4d2server/left4dead2/motd.txt

COPY --chown=appuser:appuser ./l4d2/cfg/admins.cfg /home/appuser/l4d2server/left4dead2/addons/sourcemod/configs/admins.cfg
COPY --chown=appuser:appuser ./l4d2 /home/appuser/l4d2server/left4dead2/l4d2/
COPY --chown=appuser:appuser entrypoint.sh /home/appuser/entrypoint.sh

USER appuser
ENTRYPOINT ["/bin/bash", "/home/appuser/entrypoint.sh"]

