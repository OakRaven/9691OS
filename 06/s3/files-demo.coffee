AWS = require 'aws-sdk'
fs = require 'fs'

AWS.config.loadFromPath './config.json'

S3 = new AWS.S3()

uploadFile = (bucket, filename, key, callback) ->
  console.log 'Uploading: ', filename, key

  fs.readFile filename, (err, fileData) ->
    params =
      Bucket: bucket
      Key: key
      Body: fileData
      ACL: 'public-read'

    S3.putObject params, (err, data) ->
      if err?
        console.log 'Error: ', err
      else
        console.log 'Success: ', data

      callback()


listAllFiles = (bucket, callback) ->
  console.log 'Listing all files:'

  params =
    Bucket: bucket

  S3.listObjects params, (err, data) ->
    if err?
      console.log 'Error: ', err
    else
      console.log 'Success: ', data

    callback()


fetchFile = (bucket, key, filename, callback) ->
  console.log 'Fetching a file:'

  params =
    Bucket: bucket
    Key: key

  S3.getObject params, (err, data) ->
    if err?
      console.log 'Error: ', err
    else
      fs.writeFile filename, data.Body, (err) ->
        console.log 'Success: ', data.ETag, data.ContentType

    callback()


deleteFile = (bucket, key, callback) ->
  console.log 'Deleting: ', key

  params =
    Bucket: bucket
    Key: key

  S3.deleteObject params, (err, data) ->
    if err?
      console.log 'Error: ', err
    else
      console.log 'Success: ', data

    callback()


bucket = 'demo.mwhatfield.com'

uploadFile bucket, './cover.jpg', 'cover.jpg', ->
  listAllFiles bucket, ->
    fetchFile bucket, 'cover.jpg', './cover-2.jpg', ->
      deleteFile bucket, 'cover.jpg', ->
        console.log 'Completed.'
