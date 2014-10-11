mongo = require 'mongodb'
server = new mongo.Server('localhost', 27017)
db = new mongo.Db('test', server, {safe: true})

displayEmployee = (emp) ->
  console.log "#{emp.id}\t" +
    "#{emp.firstName} #{emp.lastName}\t" +
    "#{emp.salesYtd}"

db.open (err, db) ->
  collection = db.collection 'employees'
  # collection.remove {id: 3}, (err, res) ->
  #   console.dir res
  #   collection.find().toArray (err, docs) ->
  #     console.log "ALL"
  #     (displayEmployee doc) for doc in docs

  collection.update {id: {$gt: 0}}, \
    {$set: {department: 'Sales'}}, \
    (err, res) ->
      console.log err if err?
      console.dir res if res?
      db.close()