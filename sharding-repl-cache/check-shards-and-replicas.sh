#!/bin/bash

docker compose exec -Ti shard1 mongosh --port "27030"<<EOF
use somedb;
var counts = db.helloDoc.countDocuments();
console.log('Количество документов (shard 1) =', counts);
exit();
EOF

docker compose exec -Ti shard1-repl1 mongosh --port "27031"<<EOF
use somedb;
var counts = db.helloDoc.countDocuments();
console.log('Количество документов (shard 1 replica 1) =', counts);
exit();
EOF

docker compose exec -Ti shard1-repl2 mongosh --port "27032"<<EOF
use somedb;
var counts = db.helloDoc.countDocuments();
console.log('Количество документов (shard 1 replica 2) =', counts);
exit();
EOF

docker compose exec -Ti shard2 mongosh --port  "27040"<<EOF
use somedb;
var counts = db.helloDoc.countDocuments();
console.log('Количество документов (shard 2) =', counts);
exit();
EOF

docker compose exec -Ti shard2-repl1 mongosh --port  "27041"<<EOF
use somedb;
var counts = db.helloDoc.countDocuments();
console.log('Количество документов (shard 2 replica 1) =', counts);
exit();
EOF

docker compose exec -Ti shard2-repl2 mongosh --port  "27042"<<EOF
use somedb;
var counts = db.helloDoc.countDocuments();
console.log('Количество документов (shard 2 replica 2) =', counts);
exit();
EOF

docker compose exec -Ti mongos_router mongosh --port  "27020"<<EOF
use somedb;
var counts = db.helloDoc.countDocuments();
console.log('Общее количество документов (mongos_router) =', counts);
exit();
EOF