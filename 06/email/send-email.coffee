nodemailer = require 'nodemailer'
mailerConfig = require './mailer-config'

smtpServer = nodemailer.createTransport 'SMTP', mailerConfig

email =
  from: mailerConfig.sender
  to: 'Mike Hatfield <mwhatfield@outlook.com>'
  subject: 'Test Email'
  text: 'Holy, it worked!'
  html: '<b>Holy, it worked!</b>'

smtpServer.sendMail email, (err, response) ->
  if err
    console.log err
  else
    console.log "Message sent: #{response.message}"

  smtpServer.close()