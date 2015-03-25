TwilioClient = require 'twilio'
config = require './twilio-config'

client = new TwilioClient config.sid, config.token

message =
  mediaUrl: 'http://mwhatfield.com/9691OS/cover.jpg'
  to: '+1 902-440-4306'
  from: config.from

client.messages.create message, (err, msg) ->
  if err?
    console.log err
  else
    console.log msg.sid
