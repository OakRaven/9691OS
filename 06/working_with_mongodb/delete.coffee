MongoClient = require('mongodb').MongoClient
url = 'mongodb://localhost:27017/test'

MongoClient.connect url, (err, db) ->
  collection = db.collection 'employees'

  collection.remove {id: 3}, (err, res) ->
    console.dir res
