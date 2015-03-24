cradle = require 'cradle'
db = (new(cradle.Connection)).database 'test'

update =
  salesYtd: 3405.98
  department:
    id: 1
    description: 'Sales'

db.merge 'EMP:3', update, (err, result) ->
  unless err?
    console.dir result
  else
    console.log err
