AWS = require 'aws-sdk'
fs  = require 'fs'
Q   = require 'q'

AWS.config.loadFromPath './config.json'

S3 = new AWS.S3()

uploadFile = (bucket, filename, key) ->
  console.log "Uploading #{filename} -> #{key}"
  
  deferred = Q.defer()
  buffer = fs.readFileSync filename
  
  params =
    Bucket: bucket
    Key: key
    Body: buffer
    ACL: 'public-read'

  S3.putObject params, (err, data) ->
    if err?
      deferred.reject err
    else
      console.log 'Uploading success:', data
      deferred.resolve()

  deferred.promise


listAllFiles = (bucket) ->
  console.log 'Listing all files:'

  deferred = Q.defer()
  
  params =
    Bucket: bucket

  S3.listObjects params, (err, data) ->
    if err?
      deferred.reject err
    else
      if data.Contents
        for item in data.Contents
          console.log "  ETag: #{item.ETag}\n" +
            "  Key:  #{item.Key}\n" +
            "  Size:  #{item.Size} bytes"
      deferred.resolve()

  deferred.promise


fetchFile = (bucket, key, filename) ->
  console.log "Fetching a file #{key} -> #{filename}"

  deferred = Q.defer()
  
  params =
    Bucket: bucket
    Key: key

  S3.getObject params, (err, data) ->
    if err?
      deferred.reject err
    else
      fs.writeFileSync filename, data.Body
      console.log "Fetching a file success ETag: #{data.ETag}"
      deferred.resolve()
      
  deferred.promise


deleteFile = (bucket, key) ->
  console.log "Deleting remote file #{key}"
  
  deferred = Q.defer()

  params =
    Bucket: bucket
    Key: key

  S3.deleteObject params, (err, data) ->
    if err?
      deferred.reject err
    else
      console.log 'Deleting success'
      deferred.resolve()
      
  deferred.promise


bucket = 'demo.mwhatfield.com'

uploadFile bucket, './cover.jpg', 'cover.jpg'
  .then -> listAllFiles bucket
  .then -> fetchFile bucket, 'cover.jpg', './cover-2.jpg'
  .then -> deleteFile bucket, 'cover.jpg'
  .catch (error) ->
    console.log "Error: #{error}"
  .done -> console.log 'Completed.'
