sqlite = require 'sqlite3'

db = new sqlite.Database 'sample.db'

sql = 'select * from Departments order by description'
db.all sql, (err, rows) ->
  unless err?
    console.log "There are #{rows.length} departments."
    for row in rows
      console.log "#{row.id}: #{row.description}" 
  else
    console.log err
