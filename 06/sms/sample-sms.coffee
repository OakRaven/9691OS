TwilioClient = require 'twilio'
config = require './twilio-config'

client = new TwilioClient config.sid, config.token

message =
  body: 'Welcome from CoffeeScript'
  to: '+1 902-440-4306'
  from: config.from

client.messages.create message, (err, msg) ->
  if err?
    console.log err
  else
    console.log msg.sid
