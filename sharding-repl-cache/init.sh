#!/bin/bash

echo 'Start initiating mongo cluster'
docker compose up -d

sleep 10
echo 'Start configure configSrv'
docker exec -it configSrv mongosh --port 27017 --shell /configSrv-init.js

sleep 5
echo 'Start configure shard1 and replicas'
docker exec -it shard1 mongosh --port 27030 --shell /shard1-repl-init.js

sleep 5
echo 'Start configure shard2 and replicas'
docker exec -it shard2 mongosh --port 27040 --shell /shard2-repl-init.js

sleep 5
echo 'Start configure mongos_router'
docker exec -it mongos_router mongosh --port 27020 --shell /mongos_router-init.js
docker exec -it mongos_router mongosh --port 27020 --shell /mongos_router-fill-data.js

echo 'Start configure redis cache'
./scripts/redis-cache-init.sh

echo 'Done!'

