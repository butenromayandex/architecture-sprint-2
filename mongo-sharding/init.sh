#!/bin/bash

echo 'Start initiating mongo cluster'
docker compose up -d --force-recreate

sleep 5

echo 'Start configure configSrv'
docker exec -it configSrv mongosh --port 27017 --shell /configSrv-init.js

echo 'Start configure shard1'
docker exec -it shard1 mongosh --port 27018 --shell /shard1-init.js

echo 'Start configure shard2'
docker exec -it shard2 mongosh --port 27019 --shell /shard2-init.js

sleep 5
echo 'Start configure mongos_router'
docker exec -it mongos_router mongosh --port 27020 --shell /mongos_router-init.js
docker exec -it mongos_router mongosh --port 27020 --shell /mongos_router-fill-data.js
echo 'Done!'


