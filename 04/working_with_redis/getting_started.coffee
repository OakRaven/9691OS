redis = require 'redis'
client = redis.createClient()

client.on 'error', (err) ->
  console.log "Error: #{err}"

client.on 'connect', ->
  console.log 'Connected to Redis successfully.'
  client.quit()