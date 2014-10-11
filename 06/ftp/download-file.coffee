fs = require 'fs'
Client = require 'ftp'
config = require './ftp-config'

connect = (callback) ->
  client = new Client()
  client.on 'ready', -> callback(null, client)
  client.on 'error', (err) -> callback(err, null)
  client.connect config

remote = '/cover.jpg'
local = 'cover-downloaded.jpg'

download = (remote, local, config, callback, mode = 'binary') ->
  performDownload = (client) ->
    client.get remote, (err, stream) ->
      if err?
        callback err
      else
        stream.once 'close', ->
          client.end()
          callback()
        stream.pipe (fs.createWriteStream local)

  modeSelected = (err, client) ->
    if err?
      callback err
    else
      performDownload client

  connected = (err, client) ->
    if err?
      callback err
    else
      if mode in ['binary', 'bin', 'b']
        client.binary (err) -> modeSelected err, client
      else
        client.ascii (err) -> modeSelected err, client

  connect config, connected

download remote, local, (err) ->
  if err?
    console.log "#{err}"
  else
    console.log "#{local} download complete"
