dns = require 'dns'

reverseLookup = (ipAddress, callback) ->
  dns.reverse ipAddress, (err, result) ->
    if err?
      console.log err
    else
      callback result

reverseLookup '74.125.226.73', (domains) ->
  console.log "74.125.226.73: #{JSON.stringify domains}"

reverseLookup '207.97.227.245', (domains) ->
  console.log "207.97.227.245: #{JSON.stringify domains}"