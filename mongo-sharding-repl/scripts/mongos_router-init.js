sh.addShard( "rs0/shard1:27030");
sh.addShard( "rs1/shard2:27040");

sh.enableSharding("somedb");
sh.shardCollection("somedb.helloDoc", { "name" : "hashed" } );
exit();