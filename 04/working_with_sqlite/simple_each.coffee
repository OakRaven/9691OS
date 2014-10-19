sqlite = require 'sqlite3'

db = new sqlite.Database 'sample.db'

sql = 'select * from Departments order by description'

db.each sql, (err, row) ->
  unless err?
    console.log "#{row.id}: #{row.description}"
  else
    console.log err
