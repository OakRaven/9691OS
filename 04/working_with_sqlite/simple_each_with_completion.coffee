sqlite = require 'sqlite3'

db = new sqlite.Database('sample.db')

sql = 'select * from Departments order by description'

displayRow = (err, row) ->
  unless err?
    console.log "#{row.id}: #{row.description}"
  else
    console.log "#{err}"

displayRowCount = (err, rowCount) ->
  unless err?
    console.log "Processed #{rowCount} rows."
  else
    console.log "#{err}"

db.each sql, displayRow, displayRowCount