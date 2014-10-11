sqlite = require 'sqlite3'

db = new sqlite.Database('sample.db')

sql = "INSERT INTO Employees (
  first_name,
  last_name,
  department_id
) VALUES ($first, $last, $dept_id)"

db.run sql, { $first: 'Hannah', $last: 'Belle', $dept_id: 7 }, (err) ->
  unless err?
    console.log 'Employee added...'
  else
    console.log "#{err}"