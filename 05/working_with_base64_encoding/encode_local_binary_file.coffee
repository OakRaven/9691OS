fs = require 'fs'
btoa = require 'btoa'
atob = require 'atob'

encode = (source, destination) ->
  data = fs.readFileSync source
  base64 = btoa data
  fs.writeFileSync destination, base64, 'ascii'

decode = (source, destination) ->
  data = fs.readFileSync source, 'ascii'
  binary = atob data
  fs.writeFileSync destination, binary, 'binary'

encode 'logo.png', 'logo.encoded'
decode 'logo.encoded', 'logo.decoded.png'