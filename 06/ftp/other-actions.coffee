Client = require 'ftp'
config = require './ftp-config'

connect = (callback) ->
  client = new Client()
  client.on 'ready', -> callback(null, client)
  client.on 'error', (err) -> callback(err, null)

  client.connect config

getDirectoryList = (rootPath, callback) ->
  console.log 'Getting list: ', rootPath
  connected = (err, client) ->
    if err?
      callback err
    else
      client.list rootPath, (err, data) ->
        client.end()
        console.dir data
        console.log '-- Completed'
        callback()

  connect connected

createDirectory = (directoryName, callback) ->
  console.log 'Creating directory: ', directoryName
  connected = (err, client) ->
    if err?
      callback err
    else
      client.mkdir directoryName, (err) ->
        client.end()
        console.log '-- Completed'
        callback()

  connect connected

deleteDirectory = (directoryName, callback) ->
  console.log 'Deleting directory: ', directoryName
  connected = (err, client) ->
    if err?
      callback err
    else
      client.rmdir directoryName, (err) ->
        client.end()
        console.log '-- Completed'
        callback()

  connect connected

deleteFile = (filePath, callback) ->
  console.log 'Deleting file: ', filePath
  connected = (err, client) ->
    if err?
      callback err
    else
      client.delete filePath, (err) ->
        client.end()
        console.log '-- Completed'
        callback()

  connect connected


connect (client) ->
  getDirectoryList '/public_html/9691OS', ->
    createDirectory '/public_html/9691OS/temp', ->
      deleteDirectory '/public_html/9691OS/temp', ->
        deleteFile '/public_html/9691OS/cover.jpg', ->
          console.log 'COMPLETED'

