MongoClient = require('mongodb').MongoClient
url = 'mongodb://localhost:27017/test'
MongoClient.connect url, (err, db) ->
  unless err?
    console.log 'Connection establisted'
  else
    console.log err

  db.close()
