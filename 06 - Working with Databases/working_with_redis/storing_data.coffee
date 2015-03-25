redis = require 'redis'
client = redis.createClient()

client.on 'error', (err) ->
  console.log "Error: #{err}"

employee =
  id: '001'
  firstName: 'Tracy'
  lastName: 'Ouellette'
  salesYtd: 4503.40

# scalar values
client.set 'sales-001', 4503.40

client.set 'sales-002', 3406.98, (err, res) ->
  console.dir res

client.set 'eom', 'Tracy Ouellette', redis.print

client.set employee.id, (JSON.stringify employee)