MongoClient = require('mongodb').MongoClient

url = 'mongodb://localhost:27017/test'
MongoClient.connect url, (err, db) ->
  collection = db.collection 'employees'

  employees =[
    { id: 1, first: 'Tracy', last: 'Ouellette', salesYtd: 22246 }
    { id: 2, first: 'Chris', last: 'Daniel', salesYtd: 3876 }
    { id: 3, first: 'Jason', last: 'Alexander', salesYtd: 4095 }
    { id: 4, first: 'Jennifer', last: 'Hannah', salesYtd: 8070 }
    { id: 5, first: 'Maxx', last: 'Slayde', salesYtd: 2032 }
  ]

  collection.insert employees, (err, result) ->
    unless err?
      console.dir result
    else
      console.log err

    db.close()
