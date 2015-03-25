fs     = require 'fs'
Client = require 'ftp'
Q      = require 'q'
config = require './ftp-config'

FTP_MODE_BIN = 'binary'
FTP_MODE_ASC = 'ascii'
connection = null

connect = ->
  console.log 'Connecting'
  deferred = Q.defer()
  
  connection = new Client()
  connection.on 'ready', ->
    console.log '   connection established'
    deferred.resolve()
  connection.on 'error', (err) ->
    console.log '   error connecting'
    deferred.reject err
  
  connection.connect config
  deferred.promise
  

setMode = (mode) ->
  console.log "Setting mode to #{mode}"
  deferred = Q.defer()
  
  connection[mode] (err) ->
    if err
      console.log '   error setting mode'
      deferred.reject err
    else
      console.log "   mode set to #{mode}"
      deferred.resolve()
      
  deferred.promise
  

download = (remote, local) ->
  console.log "Downloading #{remote} to #{local}"
  deferred = Q.defer()
  
  connection.get remote, (err, stream) ->
    if err?
      deferred.reject err
    else
      stream.once 'close', ->
        console.log '   download complete'
        deferred.resolve()
      
      stream.pipe fs.createWriteStream(local)

  deferred.promise

  
connect()
  .then -> setMode FTP_MODE_BIN
  .then -> download '/cover.jpg', 'cover-downloaded.jpg'
  .catch (err) ->
    console.log "Error:", err
  .fin ->
    connection.end() if connection?
    console.log 'Connection closed'
