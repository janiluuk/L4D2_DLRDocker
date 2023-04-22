# Left 4 Dead 2 - DLR Edition All-in-one Dockerized!


This setup lets you run Left4Dead 2 server with pre-installed [DLR](https://github.com/janiluuk/L4D2_DLR) gamemode, [rcon](https://github.com/itzg/docker-rcon-web-admin/) Web admin console, Public web panel with detailed statistics, ranking and game info, Mysql server for storing statistics with [adminer](https://github.com/vrana/adminer) database admin UI. Feel free to add more servers in the compose file or take out the ones you dont need.

## Getting Started

### Windows

* Download the latest release, unpack it to some directory. 
* Go to https://www.docker.com/ - click "Download Docker Desktop"
* Install Docker
* Restart computer
* Run Docker Desktop
* Open "Dev Environments"
* Choose "Create new environment", and "Get Started"
* Choose name (f.ex L4D2 DLR)
* Choose source as "Local directory", press Select and choose the directory that you unpacked the release, and press "Continue"
* After brewing, you should have full setup running. 
	
### Linux
To get up and running quickly, use

```
docker-compose up -e <ENV_VARIABLES> docker-compose.yml
```
For default behavior, running `docker-compose up` should be enough.

If you change something, such as edit config file or add / remove files, the container will restart automatically.

## Configuration

### First steps

- Modify l4d2/cfg/server.cfg to match your preference
- Modify `docker-compose.yml` to match your preference
- Modify `l4d2/host.txt` and `l4d2/motd.txt` to match your preference

### Editing `docker-compose.yml`

* Change all passwords to new ones
* Change default starting map to your liking
* If you do not with to use statistics, player ranking and server status monitor, you can comment out `db`, `adminer`, and `nginx` sections

### Directories

* l4d2/addons
This contains default installation of current DLR dev version. Feel free to change or replace the contents as you wish

* l4d2/cfg
This contains your server's config files

* l4d2/libz
This contains libz library that game needs to connect to local database instance. If you do not use database in any of your plugins, this is not needed.

### Adding more servers

Under `docker-compose.yml` there are 2 additional servers. Feel free to add more if needed.
For each server, you'll need separate config file. In example setup these server files are called `server_2.cfg` and `server_3.cfg`. You can copy `server.cfg` and change the contents accordingly.

## RCON Admin & Web panel

See [rcon instructions](https://github.com/rcon-web-admin/rcon-web-admin#visit-the-ui) and
access the web UI at http://YOUR_DOCKER_HOST:4326
For example by default http://localhost:4326 should work
*Only 1 server is configured by default. You'll have to add additional servers through "Server Management" - section*
For web panel you can connect to "http://localhost:8080" to access the statistics. 
*Web panel might still have some issues, expect fully tested one on next release*

## Options
* TODO

## Volumes

All mounts are found under `l4d2` directory. Remove / add to your preference.

### PORT Reference
* 27015 : Server
* 8080 : web panel
* 3306 : mysql 
* 4326 : web admin
* 4327 : websocket access from UI

