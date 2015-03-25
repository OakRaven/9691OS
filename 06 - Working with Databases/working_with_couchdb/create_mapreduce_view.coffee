cradle = require 'cradle'
db = (new(cradle.Connection)).database 'vehicles'

view =
  byWheelCount:
    map: (doc) ->
      emit doc.wheelCount, 1
    reduce: (key, values, rereduce) ->
      return (sum values)

db.save '_design/aggregate', view