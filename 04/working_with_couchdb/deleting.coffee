cradle = require 'cradle'
db = (new(cradle.Connection)).database 'test'

db.remove 'EMP:3', (err, res) ->
  unless err?
    console.dir res
  else
    console.dir err

  db.get 'EMP:3', (err, res) ->
    console.log err if err?
