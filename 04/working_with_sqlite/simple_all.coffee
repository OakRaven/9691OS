sqlite = require 'sqlite3'

db = new sqlite.Database('sample.db')

sql = 'select * from Departments order by description'

db.all sql, (err, rows) ->
  unless err?
    console.log "There are #{rows.length} departments."
    (console.log "#{row.id}: #{row.description}") for row in rows
  else
    console.log "#{err}"