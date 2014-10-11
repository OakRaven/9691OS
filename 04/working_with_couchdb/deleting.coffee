cradle = require 'cradle'
db = (new(cradle.Connection)).database 'blog'

yoda =
  id: 'sw-yoda'
  type: 'test'
  name: 'Yoda'

db.save yoda.id, yoda, (err, res) ->
  unless err?
    if res.ok

      db.remove yoda.id, (err, res) ->
        unless err?
          console.dir res
        else
          console.dir err