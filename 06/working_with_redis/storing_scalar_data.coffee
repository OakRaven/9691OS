redis = require 'redis'
client = redis.createClient()

client.on 'error', (err) ->
  console.log "Error: #{err}"

client.set 'sales-001', 4503.40

client.set 'sales-002', 3406.98, (err, res) ->
  console.log res

employee =
  id: '001'
  firstName: 'Tracy'
  lastName: 'Ouellette'
  salesYtd: 4503.40

client.set employee.id, (JSON.stringify employee)

client.exists 'sales-002', (err, res) ->
  console.log "sales-002 exists? #{res}"

client.setnx 'sales-002', 3100.95, (err, res) ->
  console.log "sales-002 set: #{res}"

client.get 'sales-001', (err, value) ->
  unless err?
    console.log "Value: #{value}"

client.get employee.id, (err, objString) ->
  unless err?
    emp = (JSON.parse objString)
    console.dir emp

  client.quit()
