var res = rs.initiate(
  {
    _id: "rs0",
    members: [
      { _id: 0, host: "shard1:27030" },
      { _id: 1, host: "shard1-repl1:27031" },
      { _id: 2, host: "shard1-repl2:27032" },
    ]
  }
);
console.log(res)
exit();