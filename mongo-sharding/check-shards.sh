#!/bin/bash

docker compose exec -Ti shard1 mongosh --port "27018"<<EOF
use somedb;
var counts = db.helloDoc.countDocuments();
console.log('Количество документов (shard1) =', counts);
exit();
EOF

docker compose exec -Ti shard2 mongosh --port  "27019"<<EOF
use somedb;
var counts = db.helloDoc.countDocuments();
console.log('Количество документов (shard2) =', counts);
exit();
EOF

docker compose exec -Ti mongos_router mongosh --port  "27020"<<EOF
use somedb;
var counts = db.helloDoc.countDocuments();
console.log('Общее количество документов (mongos_router) =', counts);
exit();
EOF