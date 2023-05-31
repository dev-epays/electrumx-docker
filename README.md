docker-compose.yml example
```
services:
  electrum:
    build: ./electrum
    environment:
      COIN: "Dogecoin"
      DB_DIRECTORY: "/data/"
      DAEMON_URL: "http://dogecoin:dogecoin@core:22555/"
      SERVICES: "tcp://0.0.0.0:50002"
```
