cradle = require 'cradle'
db = (new(cradle.Connection)).database 'test'

displayEmployee = (emp) ->
  console.log "Employee: #{emp.first} #{emp.last}"

db.get 'EMP:3', (err, doc) ->
  console.log 'Single Document:'
  unless err?
    displayEmployee doc
  else
    console.dir err

db.get ['EMP:1', 'EMP:5'], (err, docs) ->
  console.log '\nMultiple Documents:'
  unless err?
    (displayEmployee item.doc) for item in docs
