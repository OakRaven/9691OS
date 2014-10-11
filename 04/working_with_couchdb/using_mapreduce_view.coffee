cradle = require 'cradle'
db = (new(cradle.Connection)).database 'vehicles'

options =
  group: false
  reduce: false

db.view 'aggregate/byWheelCount', options, (err, results) ->
  unless err?
    console.dir results
    # console.log "Wheels\tRecords"
    # for result in results
    #   console.log "#{result.key}\t#{result.value}"