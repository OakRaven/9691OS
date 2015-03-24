MongoClient = require('mongodb').MongoClient
url = 'mongodb://localhost:27017/test'

MongoClient.connect url, (err, db) ->
  collection = db.collection 'employees'

  collection.update {}, \
    {$set: {department: 'Sales'}}, \
    {multi: true}, \
    (err, result) ->
      collection.findOne {id: 3}, (err, employee) ->
        console.dir employee if employee
        db.close()
