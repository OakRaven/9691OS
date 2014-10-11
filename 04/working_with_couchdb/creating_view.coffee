cradle = require 'cradle'
db = (new(cradle.Connection)).database 'vehicles'

view =
  twoWheels:
    map: (doc) ->
      if doc.wheelCount? and doc.wheelCount is 2
        emit doc._id, doc

db.save '_design/query', view