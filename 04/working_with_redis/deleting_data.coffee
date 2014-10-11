redis = require 'redis'
client = redis.createClient()

client.on 'error', (err) ->
  console.log "Error: #{err}"

# read configuration from external database
config =
  debugLevel:  'info'
  emailHost:   '10.1.1.250'
  emailUseSsl: true
  emailFrom:   'no-reply@domain.com'

client.hmset 'config', config, redis.print
client.expire 'config', 5

counter = 0
timerHandle = null

checkForExpiry = ->
  counter++
  client.hgetall 'config', (err, obj) ->
    unless err?
      if obj?
        console.log "Config is still alive: #{counter} sec"
      else
        console.log "Config is expired: #{counter} sec"
        clearTimeout timerHandle
        client.quit()

timerHandle = setInterval checkForExpiry, 1000

# manually delete configuration object
client.del 'config', redis.print