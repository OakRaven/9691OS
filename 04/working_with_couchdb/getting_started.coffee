cradle = require 'cradle'
db = (new(cradle.Connection)).database 'test'

db.exists (err, exists) ->
  console.log exists
  if exists
    console.log 'test database exists'
  else
    console.log 'test database does not exist'
    db.create()
    console.log 'test database has been created'
