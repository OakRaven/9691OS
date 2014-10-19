sqlite = require 'sqlite3'

db = new sqlite.Database 'sample.db'

createTable = (callback) ->
  sql = "CREATE TABLE Cities (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(100) NOT NULL
    )"

  db.exec sql, (err) ->
    callback err

insertIntoTable = (callback) ->
  sql = "INSERT INTO Cities (name) VALUES ('Halifax')"
  db.exec sql, (err) ->
    callback err

selectFromTable = (callback) ->
  db.get 'SELECT * FROM Cities', (err, row) ->
    console.log "City: #{row.name}" unless err?
    callback err

dropTable = (callback) ->
  db.exec 'DROP TABLE Cities', (err) ->
    callback err

createTable (err) ->
  unless err?
    insertIntoTable (err) ->
      unless err?
        selectFromTable (err) ->
          unless err?
            dropTable (err) ->
              unless err?
                console.log 'SUCCESS!'
              else
                console.log 'FAILD'
