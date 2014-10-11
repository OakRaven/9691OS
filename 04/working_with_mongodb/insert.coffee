mongo = require 'mongodb'
server = new mongo.Server('localhost', 27017)
db = new mongo.Db('test', server, {safe: true})

employee =
  id: '001'
  firstName: 'Tracy'
  lastName: 'Ouellette'
  salesYtd: 4503.40

# save a single document
db.open (err, db) ->
  collection = db.collection 'employees'
  collection.insert employee, (err, result) ->
    console.log "#{err}" if err?
    console.dir result
    db.close()