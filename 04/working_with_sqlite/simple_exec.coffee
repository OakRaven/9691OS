sqlite = require 'sqlite3'

db = new sqlite.Database('sample.db')

createTables = (callback) ->
  sql = "CREATE TABLE [Departments] (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    description VARCHAR (100)
  );

  CREATE TABLE [Employees] (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR (50),
    last_name VARCHAR (50),
    department_id INTEGER REFERENCES Departments (id)
  );"

  db.exec sql, (err) ->
    console.log "Error creating tables: #{err}" if err?
    callback err

populateTables = (callback) ->
  departments = [
    { id: 1, desc: 'Sales' }
    { id: 2, desc: 'Customer Service' }
    { id: 3, desc: 'I.T.' }
    { id: 4, desc: 'Finance' }
    { id: 5, desc: 'Marketing' }
    { id: 6, desc: 'Human Resources' }
    { id: 7, desc: 'Research and Development' }
  ]

  employees = [
    { id: 1, first: 'Tracy', last: 'Ouellette', dept: 1 }
    { id: 2, first: 'Chris', last: 'Daniel', dept: 1 }
    { id: 3, first: 'Jason', last: 'Alexander', dept: 3 }
    { id: 4, first: 'Jennifer', last: 'Hannah', dept: 7 }
    { id: 5, first: 'Maxx', last: 'Slayde', dept: 4 }
  ]

  for item in departments
    sql = "INSERT INTO [Departments] VALUES(?, ?)"
    db.run sql, item.id, item.desc, (err) ->
      callback err if err?

  for item in employees
    sql = "INSERT INTO [Employees] VALUES(?, ?, ?, ?)"
    db.run sql, item.id, item.first, item.last, item.dept, (err) ->
      callback err if err?

  callback()

createTables (err) ->
  unless err?
    populateTables (err) ->
      unless err?
        console.log 'Database prepped...'
      else
        console.log err
