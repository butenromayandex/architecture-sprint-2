var sdb = db.getSiblingDB('somedb');

for(var i = 0; i < 1000; i++) sdb.helloDoc.insert({age:i, name:"ly"+i});

var counts = sdb.helloDoc.countDocuments()

console.log('counts = ', counts)
rs.status()
exit();