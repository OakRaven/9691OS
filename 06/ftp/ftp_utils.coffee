fs = require 'fs'
Client = require 'ftp'

connect = (config, callback) ->
  client = new Client()
  client.on 'ready', -> callback(null, client)
  client.on 'error', (err) -> callback(err, null)
  client.connect config

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

upload = (local, remote, config, callback, mode = 'binary') ->
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

module.exports =
  downloadFile: download
  uploadFile: upload