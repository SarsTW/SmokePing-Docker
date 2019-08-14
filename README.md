# SmokePing Master/Slave in Docker

## Prepare

### For master

Modify smokeping_secrets file.

```
host1:mysercert
host2:yoursercert
boomer:lkasdf93uhhfdfddf
```

Add slaves into `Targets` config.

```
slaves = host2
```

Add slaves into `Slaves` config.

```
+host2
display_name=host2
color=00ff00
```

## Docker Compose

docker-compose.yaml

```
version: '3'
services:
  smokeping-master:
    image: sarstw/smokeping-docker:ubuntu19.10-2.7.3-master
    container_name: smokeping-master
    hostname: master
    restart: unless-stopped
    environment:
      - TZ=Asia/Taipei
    volumes:
      - ./nginx.conf:/etc/nginx/sites-enabled/default

  smokeping-slave:
    image: sarstw/smokeping-docker:ubuntu19.10-2.7.3-slave
    container_name: smokeping-slave
    restart: unless-stopped
    environment:
      - MASTER_URL=http://smokeping-master/smokeping/
      - SLAVE_NAME=host2
      - SECRET=yoursercert
      - TZ=Asia/Taipei
```

## URL

[http://localhost:8080/smokeping/](http://localhost:8080/smokeping/)

