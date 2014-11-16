TwilioClient = require 'twilio'
config = require './twilio-config'

client = new TwilioClient config.sid, config.token

message =
  mediaUrl: 'http://mwhatfield.com/9691OS/cover.jpg'
  to: '+15554401212'
  from: '+15557071212'

client.messages.create message, (err, msg) ->
  if err?
    console.log err
  else
    console.log msg.sid
