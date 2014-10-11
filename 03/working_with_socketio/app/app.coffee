express = require 'express'
socket  = require 'socket.io'

app = express()
port = 8080

# configure Jade view engine
app.set 'views', __dirname + '/tpl'
app.set 'view engine', 'jade'
app.engine 'jade', (require 'jade').__express

# expose static assets from /public folder
app.use (express.static __dirname + '/public')

# routes
app.get '/', (req, res) ->
  res.render 'index'

app.get '/time', (req, res) ->
  res.render 'time'

app.get '/count', (req, res) ->
  res.render 'counter'

# configure socket.io and launch HTTP server
console.log "Listening on port #{port}"
server = app.listen port
io = socket.listen server

# configure message bus
io.sockets.on 'connection', (socket) ->
  value = 0
  setInterval ->
    value += 1
    socket.emit 'time', { value: new Date() }
    socket.emit 'update', { value: value }
  , 1000

  socket.on 'add', (data) ->
    value += data.amount
    socket.emit 'update', { value: value }