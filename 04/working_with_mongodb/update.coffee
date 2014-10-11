mongo = require 'mongodb'
server = new mongo.Server('localhost', 27017)
db = new mongo.Db('test', server, {safe: true})

db.open (err, db) ->
  collection = db.collection 'employees'

  # find employee
  # collection.findOne {id: 3}, (err, employee) ->
  #   if employee?
  #     employee.salesYtd = 6550
  #     employee.department = 'Sales'

  #     collection.save employee, (err, res) ->
  #       collection.findOne {id: 3}, (err, employee) ->
  #         console.dir employee if employee
  #         db.close()

  collection.update {}, \
    {$set: {department: 'Sales'}}, \
    {multi: true}, \
    (err, result) ->
      collection.findOne {id: 3}, (err, employee) ->
        console.dir employee if employee
        db.close()