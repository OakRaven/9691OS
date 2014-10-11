redis = require 'redis'
client = redis.createClient()

client.on 'error', (err) ->
  console.log "Error: #{err}"

# hashes value
client.hset 'settings', 'debug-level', 'info'
client.hmset 'settings',
  'email-host', '10.1.1.250',
  'email-use-ssl', 'true',
  'email-from', 'no-reply@domain.com', redis.print

client.hget 'settings', 'email-use-ssl', redis.print
client.hgetall 'settings', (err, settings) ->
  unless err?
    console.dir settings

employee =
  id: '001'
  firstName: 'Tracy'
  lastName: 'Ouellette'
  salesYtd: 4503.40

client.hmset "emp-#{employee.id}", employee, redis.print

# lists value
fordModels = ['C-Max Hybrid', 'E-Series Wagon', 'Edge', 'Escape',
  'Expedition', 'Fiesta', 'Flex', 'Focus', 'Fusion',
  'Mustang', 'Shelby GT500', 'Taurus', 'Transit Connect Wagon']

client.del 'ford'

for model in fordModels
  client.lpush 'ford', model

# retreieve length of ford list
client.llen 'ford', redis.print

# retrieve 5 items
client.lrange 'ford', 0, 4, (err, items) ->
  console.dir items

# insert Explorer after Expedition
client.linsert 'ford', 'AFTER', 'Expedition', 'Explorer', redis.print

# check for newly inserted item
client.lrange 'ford', 8, 10, (err, items) ->
  console.dir items

# retrieve the entire list
client.lrange 'ford', 0, -1, (err, items) ->
  console.dir items

client.hget 'settings', 'debug-level', redis.print

client.hgetall "emp-#{employee.id}", (err, result) ->
  console.dir result
  client.quit()
