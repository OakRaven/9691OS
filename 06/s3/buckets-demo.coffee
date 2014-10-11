AWS = require 'aws-sdk'
AWS.config.loadFromPath './config.json'

S3 = new AWS.S3()

createNamedBucket = (name, callback) ->
    params =
        Bucket: name

    S3.createBucket params, (err, data) ->
        if err?
            console.log 'Error:', err
        else
            console.log 'Created bucket:\n', data
        callback()

listAllBuckets = (callback) ->
    displayBucket = (bucket) ->
        console.log bucket.Name

    S3.listBuckets (err, data) ->
        if err?
            console.log 'Error:', err
        else
            console.log 'Listing buckets:'
            displayBucket item for item in data.Buckets
        callback()

deleteNamedBucket = (name, callback) ->
    params =
        Bucket: name

    S3.deleteBucket params, (err, data) ->
        if err?
            console.log 'Error:', err
        else
            console.log 'Deleted bucket:', name
        callback()

createNamedBucket 'demo.mwhatfield.com', ->
    listAllBuckets ->
        deleteNamedBucket 'demo.mwhatfield.com', ->
            console.log 'Completed.'
