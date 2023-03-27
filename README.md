# Left 4 Dead 2 - DLR Edition All-in-one Dockerized!


This setup lets you run Left4Dead 2 server with pre-installed [DLR](https://github.com/janiluuk/L4D2_DLR) gamemode, [rcon](https://github.com/itzg/docker-rcon-web-admin/) Web console, Web panel with full statistics, Mysql server for storing statistics with [adminer](https://github.com/vrana/adminer) database tool. Feel free to add more servers in the compose file.

## Getting Started

To get up and running quickly, use

```
docker-compose up -e <ENV_VARIABLE>
```

With that you can follow the [regular instructions](https://github.com/rcon-web-admin/rcon-web-admin#visit-the-ui) and
access the web UI at http://YOUR_DOCKER_HOST:4326

## Options
* TODO

## Volumes

### [Environment Variables]
* TODO

### PORTs
* 27015 : Server
* 8080 : 
* 3306 : mysql 
* 4326 : web UI
* 4327 : websocket access from UI

## Examples
* TODO
