cradle = require 'cradle'
db = (new(cradle.Connection)).database 'blog'

update =
  permissions: ['author', 'admin']
  updated: '2014-01-19 13:59'

db.merge 'u:mikehatfield', update, (err, result) ->
  unless err?
    console.dir result
  else
    console.log "#{err}"