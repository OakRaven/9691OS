MongoClient = require('mongodb').MongoClient
url = 'mongodb://localhost:27017/test'

MongoClient.connect url, (err, db) ->
  collection = db.collection 'employees'

  collection.update {}, { $unset: { salesYtd: '' } }, { multi: true }, (err, res) ->
    console.log err if err?
    console.dir res if res?
    db.close()
