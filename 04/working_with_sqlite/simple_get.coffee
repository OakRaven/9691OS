sqlite = require 'sqlite3'

db = new sqlite.Database 'sample.db'

sql = "select count(*) as 'count' from Employees"
db.get sql, (err, row) ->
  unless err?
    console.log "There are #{row.count} employees."
  else
    console.log err
