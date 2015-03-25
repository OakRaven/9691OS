cradle = require 'cradle'
db = (new(cradle.Connection)).database 'music'

db.view 'genres/metal', (err, docs) ->
  unless err?
    for doc in docs
      console.dir doc
  else
    console.log err