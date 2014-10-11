dns = require 'dns'

lookupIpAddress = (domainName, callback) ->
  dns.lookup domainName, (err, ipAddress) ->
    if err?
      console.log err
    else
      callback ipAddress

lookupIpAddress 'coffeescript.org', (result) ->
  console.log "CoffeeScript: #{JSON.stringify result}"

lookupIpAddress 'google.com', (result) ->
  console.log "Google: #{JSON.stringify result}"