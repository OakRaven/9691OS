nodemailer = require 'nodemailer'
config = require './mailer-config'

smtpServer = nodemailer.createTransport 'SMTP', config

email =
  from: config.sender
  to: [
    'Mike Hatfield <mwhatfield@outlook.com>'
    config.sender
  ]
  subject: 'Test Email'
  text: 'Holy, it worked!'
  html: '<b>Holy, it worked!</b>'

smtpServer.sendMail email, (err, response) ->
  if err
    console.log err
  else
    console.log "Message sent: #{response.message}"

  smtpServer.close()
