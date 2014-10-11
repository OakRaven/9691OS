sqlite = require 'sqlite3'

db = new sqlite.Database('sample.db')

sql = "INSERT INTO Employees (
  first_name,
  last_name,
  department_id
) VALUES (?, ?, ?)"

db.run sql, ['Hannah', 'Belle', 7], (err) ->
  unless err?
    console.log 'Employee added...'
  else
    console.log "#{err}"