cradle = require 'cradle'
db = (new(cradle.Connection)).database 'vehicles'

db.view 'query/twoWheels', (err, results) ->
  unless err?
    console.dir results
    for doc in results
      console.log doc.value.type