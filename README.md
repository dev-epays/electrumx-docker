docker-compose.yml example
```
services:
  electrum:
    build: https://github.com/dev-epays/electrumx-docker
    environment:
      COIN: "Dogecoin"
      DB_DIRECTORY: "/data/"
      DAEMON_URL: "http://dogecoin:dogecoin@core:22555/"
      SERVICES: "tcp://0.0.0.0:50002"
```
