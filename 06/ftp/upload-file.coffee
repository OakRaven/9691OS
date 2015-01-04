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
  

upload = (local, remote) ->
  console.log "Uploading #{local} to #{remote}"
  deferred = Q.defer()
  
  connection.put local, remote, (err) ->
    if err
      console.log '   error uploading'
      deferred.reject err
    else
      console.log '   upload complete'
      deferred.resolve()
    
  deferred.promise

  
remote = '/cover.jpg'
local = 'cover.jpg'

connect()
  .then -> setMode FTP_MODE_BIN
  .then -> upload local, remote
  .catch (err) ->
    console.log "Error:", err
  .fin ->
    connection.end() if connection?
    console.log 'Connection closed'
