MongoClient = require('mongodb').MongoClient
url = 'mongodb://localhost:27017/test'

MongoClient.connect url, (err, db) ->
  collection = db.collection 'employees'

  collection.findOne {id: 3}, (err, employee) ->
    if employee?
      employee.salesYtd = 6550
      employee.department = 'Sales'

      collection.save employee, (err, res) ->
        collection.findOne {id: 3}, (err, employee) ->
          console.dir employee if employee
          db.close()
