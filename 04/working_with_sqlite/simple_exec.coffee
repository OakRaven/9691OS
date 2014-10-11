sqlite = require 'sqlite3'

db = new sqlite.Database('sample.db')

sql = "CREATE TABLE Customers (
  id          INTEGER PRIMARY KEY AUTOINCREMENT,
  name        VARCHAR(100) NOT NULL,
  address_1   VARCHAR(50),
  address_2   VARCHAR(50),
  city        VARCHAR(25),
  province    VARCHAR(25),
  postal_code VARCHAR(10)
);"

db.exec sql, (err) ->
  unless err?
    console.log 'Table Created...'
  else
    console.log "#{err}"