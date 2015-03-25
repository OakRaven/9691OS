redis = require 'redis'
client = redis.createClient()

client.on 'error', (err) ->
  console.log "Error: #{err}"

client.on 'connect', runSample

runSample = ->
  client.set 'string key', 'Hello World', redis.print
  client.expire 'string key', 3

  checkExpiration = ->
    client.get 'string key', (err, reply) ->
      if reply?
        console.log "I live: #{reply}"
      else
        clearTimeout myTimer
        console.log 'I expired'
        client.quit()

  myTimer = setInterval checkExpiration, 1000