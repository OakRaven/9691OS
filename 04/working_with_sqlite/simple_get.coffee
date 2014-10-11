sqlite = require 'sqlite3'

db = new sqlite.Database('sample.db')

db.get "select count(*) as 'count' from Employees", (err, row) ->
  unless err?
    console.log "There are #{row.count} employees."
  else
    console.log "#{err}"

