# Left 4 Dead 2 - DLR Edition All-in-one Dockerized!


This setup lets you run Left4Dead 2 server with pre-installed [DLR](https://github.com/janiluuk/L4D2_DLR) gamemode, [rcon](https://github.com/itzg/docker-rcon-web-admin/) Web admin console, Public web panel with detailed statistics, ranking and game info, Mysql server for storing statistics with [adminer](https://github.com/vrana/adminer) database admin UI. Feel free to add more servers in the compose file or take out the ones you dont need.

## Getting Started

To get up and running quickly, use

```
docker-compose up -e <ENV_VARIABLES> ...
```

For default behavior, running `docker-compose up` should be enough.


See [rcon instructions](https://github.com/rcon-web-admin/rcon-web-admin#visit-the-ui) and
access the web UI at http://YOUR_DOCKER_HOST:4326

## Options
* TODO

## Volumes

All mounts are found under `l4d2` directory. Remove / add to your preference.

### [Environment Variables]
* TODO

### PORTs
* 27015 : Server
* 8080 : web panel
* 3306 : mysql 
* 4326 : web admin
* 4327 : websocket access from UI

## Examples
* TODO
