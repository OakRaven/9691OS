AWS = require 'aws-sdk'
AWS.config.loadFromPath './config.json'

S3 = new AWS.S3()

S3.listBuckets (err, data) ->
    if err?
        console.log err
    else
        console.log data
