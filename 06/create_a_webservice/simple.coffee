express = require 'express'
app     = express()

app.get '/', (req, res) ->
  res.send '<h1>Hello World!</h1>'

console.log 'Ready on port 3000.  Press [Ctrl+C] to stop.'
app.listen 3000
