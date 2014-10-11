cradle = require 'cradle'
db = (new(cradle.Connection)).database 'blog'

displayUser = (user) ->
  console.log "User email: #{user.email}"

key = 'u:mikehatfieeld'
db.get key, (err, doc) ->
  console.log 'Single Document:'
  unless err?
    displayUser doc
  else
    console.dir err

keys = ['u:tracyouellette', 'u:kenacker']
db.get keys, (err, docs) ->
  console.log '\nMultiple Documents:'
  unless err?
    (displayUser item.doc) for item in docs