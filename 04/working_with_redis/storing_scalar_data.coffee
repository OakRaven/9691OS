redis = require 'redis'
client = redis.createClient()

client.on 'error', (err) ->
  console.log "Error: #{err}"

employee =
  id: '001'
  firstName: 'Tracy'
  lastName: 'Ouellette'
  salesYtd: 4503.40

client.set 'sales-001', 4503.40

client.set 'sales-002', 3406.98, (err, res) ->
  console.log res

client.set 'eom', 'Tracy Ouellette', redis.print

client.set employee.id, (JSON.stringify employee)

# get values
client.get 'sales-001', redis.print

client.get employee.id, (err, objString) ->
  unless err?
    emp = (JSON.parse objString)
    console.dir emp


# initialize vistis to 0
client.set 'visits', 0

# increment visits
client.incr 'visits'
client.incr 'visits'

# display visit count
client.get 'visits', redis.print

# initialize vistis to 0
client.set 'visits', 0

# increment visits by 5
client.incrby 'visits', 5

# display visit count
client.get 'visits', redis.print
