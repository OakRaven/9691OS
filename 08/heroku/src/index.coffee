express = require 'express'
cool = require 'cool-ascii-faces'

app = express()

app.set 'port', (process.env.PORT || 5000)
app.set 'views', __dirname + '/../views'
app.set 'view engine', 'jade'

app.use express.static(__dirname + '/../public')

app.get '/', (req, res) ->
  faces = []
  times = process.env.TIMES || 5
  faces.push cool() for [0...times]
  res.render 'index', { title: 'Home', faces: faces }

app.listen app.get('port'), ->
  console.log "Node app is running at localhost:" + app.get('port')