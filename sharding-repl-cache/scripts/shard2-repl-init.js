var res = rs.initiate(
  {
    _id: "rs1",
    members: [
      { _id: 0, host: "shard2:27040" },
      { _id: 1, host: "shard2-repl1:27041" },
      { _id: 2, host: "shard2-repl2:27042" },
    ]
  }
);
console.log(res)
exit();