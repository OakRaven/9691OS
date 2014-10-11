mongo = require 'mongodb'
server = new mongo.Server('localhost', 27017)
db = new mongo.Db('test', server, {safe: true})

displayEmployee = (emp) ->
  console.log "#{emp.id}\t" +
    "#{emp.firstName} #{emp.lastName}\t" +
    "#{emp.salesYtd}"

db.open (err, db) ->
  collection = db.collection 'employees'

  # fetch all from collection
  collection.find().toArray (err, docs) ->
    console.log "ALL"
    (displayEmployee doc) for doc in docs

  # fetch one from collection
  collection.findOne {id: 3}, (err, doc) ->
    console.log "\nONE"
    displayEmployee doc if doc?

  # fetch all with sales exceeding $5,000
  collection.find({salesYtd: {$gt: 5000}}).toArray (err, docs) ->
    console.log "\nGREATER THAN $5,000"
    (displayEmployee doc) for doc in docs

  # fetch all sorted by first name
  collection.find({}, {sort: {firstName: 1}}).toArray (err, docs) ->
    console.log "\nALL SORTED BY FIRST NAME"
    (displayEmployee doc) for doc in docs

    # fetch all sorted by first name descending
    collection.find({}, {sort: {firstName: -1}}).toArray (err, docs) ->
      console.log "\nALL SORTED BY FIRST NAME DESCENDING"
      (displayEmployee doc) for doc in docs
      db.close()

