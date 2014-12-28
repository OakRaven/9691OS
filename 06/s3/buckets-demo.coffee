AWS = require 'aws-sdk'
Q   = require 'q'

AWS.config.loadFromPath './config.json'
bucketName = 'demo.mwhatfield.com'

S3 = new AWS.S3()

createNamedBucket = ->
  deferred = Q.defer()

  params = { Bucket: bucketName }

  S3.createBucket params, (err, data) ->
    if err?
      deferred.reject err
    else
      console.log "Created bucket #{bucketName}"
      deferred.resolve()

  deferred.promise


listAllBuckets = ->
  deferred = Q.defer()

  S3.listBuckets (err, data) ->
    if err?
      deferred.reject err
    else
      console.log 'Listing buckets:'
      for bucket in data.Buckets
        console.log "  Bucket: #{bucket.Name}"

      deferred.resolve()

  deferred.promise


deleteNamedBucket = ->
  deferred = Q.defer()

  params = { Bucket: bucketName }

  S3.deleteBucket params, (err, data) ->
    if err?
      deferred.reject err
    else
      console.log "Deleted bucket: #{bucketName}"
      deferred.resolve()

  deferred.promise


createNamedBucket()
  .then listAllBuckets
  .then deleteNamedBucket
  .catch (error) ->
    console.log "Error: #{error}"
  .done ->
    console.log 'Completed.'
