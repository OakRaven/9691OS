mongo = require 'mongodb'
server = new mongo.Server('localhost', 27017)
db = new mongo.Db('test', server, {safe: true})

db.open (err, db) ->
  unless err?
    console.log "Connection established..."
    db.close()
  else
    console.log "#{err}"