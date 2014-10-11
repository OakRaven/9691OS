fs = require 'fs'
Client = require 'ftp'
config = require './ftp-config'

connect = (callback) ->
  client = new Client()
  client.on 'ready', -> callback(null, client)
  client.on 'error', (err) -> callback(err, null)
  client.connect config

upload = (local, remote, callback, mode = 'binary') ->
  performUpload = (client) ->
    client.put local, remote, (err) ->
      client.end()
      callback err

  modeSelected = (err, client) ->
    if err?
      callback err
    else
      performUpload client

  connect config, (err, client) ->
    if err?
      callback err
    else
      if mode in ['binary', 'bin', 'b']
        client.binary (err) -> modeSelected err, client
      else
        client.ascii (err) -> modeSelected err, client

remote = '/cover.jpg'
local = 'cover.jpg'

upload local, remote, (err) ->
  if err?
    console.log "#{err}"
  else
    console.log "#{local} upload complete"
