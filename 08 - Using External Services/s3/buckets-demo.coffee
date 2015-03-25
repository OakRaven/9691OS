AWS = require 'aws-sdk'
Q   = require 'q'

AWS.config.loadFromPath './config.json'

S3 = new AWS.S3()

createNamedBucket = (name) ->
  deferred = Q.defer()

  params = { Bucket: name }

  S3.createBucket params, (err, data) ->
    if err?
      deferred.reject err
    else
      console.log "Created bucket #{name}\n#{JSON.stringify data}"
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


deleteNamedBucket = (name) ->
  deferred = Q.defer()

  params = { Bucket: name }

  S3.deleteBucket params, (err, data) ->
    if err?
      deferred.reject err
    else
      console.log "Deleted bucket: #{name}"
      deferred.resolve()

  deferred.promise


createNamedBucket('demo.mwhatfield.com')
  .then -> listAllBuckets()
  .then -> deleteNamedBucket('demo.mwhatfield.com')
  .catch (error) ->
    console.log "Error: #{error}"
  .done ->
    console.log 'Completed.'
