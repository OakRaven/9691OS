sqlite = require 'sqlite3'

db = new sqlite.Database('sample.db')

db.serialize ->
  db.run "CREATE TABLE Cities (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(100) NOT NULL
    )"

  db.run "INSERT INTO Cities (name) VALUES ('Halifax')"

  db.get 'SELECT * FROM Cities', (err, row) ->
    unless err?
      console.log "City: #{row.name}"
    else
      console.log "#{err}"

  db.run 'DROP TABLE Cities'
