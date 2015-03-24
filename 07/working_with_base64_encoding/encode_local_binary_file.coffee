fs = require 'fs'
btoa = require 'btoa'
atob = require 'atob'

encode = (source, destination, callback) ->
  fs.readFile source, (err, data) ->
    base64 = btoa data
    fs.writeFile destination, base64, 'ascii', (err) ->
      callback() if callback?

decode = (source, destination, callback) ->
  fs.readFile source, 'ascii', (err, data) ->
    binary = atob data
    fs.writeFile destination, binary, 'binary', (err) ->
      callback() if callback?

encode 'logo.png', 'logo.encoded', ->
  console.log 'Finished encoding file.'

  decode 'logo.encoded', 'logo.decoded.png', ->
    console.log 'Finished decoding file'
