Client = require 'ftp'
Q      = require 'Q'
config = require './ftp-config'

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


getDirectoryList = (rootPath) ->
  console.log "Getting list: #{rootPath}"
  deferred = Q.defer()
  
  connection.list rootPath, (err, data) ->
    if err?
      deferred.reject err
    else
      console.dir data
      console.log '   listing complete'
      deferred.resolve()
      
  deferred.promise

  
createDirectory = (directoryName) ->
  console.log "Creating directory: #{directoryName}"
  deferred = Q.defer()

  connection.mkdir directoryName, (err) ->
    if err?
      deferred.reject err
    else
      console.log '   create directory completed'
      deferred.resolve()
      
  deferred.promise
  
      
deleteDirectory = (directoryName) ->
  console.log "Deleting directory: #{directoryName}"
  deferred = Q.defer()

  connection.rmdir directoryName, (err) ->
    if err?
      deferred.reject err
    else
      console.log '   delete directory completed'
      deferred.resolve()
  
  deferred.promise


deleteFile = (filePath) ->
  console.log "Deleting file: #{filePath}"
  deferred = Q.defer()
  
  connection.delete filePath, (err) ->
    if err?
      deferred.reject err
    else
      console.log '   delete file completed'
      deferred.resolve()

        
  deferred.promise


connect()
  .then -> getDirectoryList '/'
  .then -> createDirectory '/temp'
  .then -> deleteDirectory '/temp'
  .then -> deleteFile '/cover.jpg'
  .catch (err) ->
    console.log "Error:", err
  .fin ->
    connection.end() if connection?
    console.log 'Connection closed'
