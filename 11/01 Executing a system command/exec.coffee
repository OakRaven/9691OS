exec = require('child_process').exec

# example 1, using defults
exec 'coffee --help', (error, stdout, stderr) ->
  if error
    console.error error

  if stdout
    console.log "Received #{stdout.length} bytes."
    console.log stdouts

# example 2, timeout causes call to fail
exec 'coffee --help', { timeout: 5 }, (error, stdout, stderr) ->
  if error
    console.error error

  if stdout
    console.log "Received #{stdout.length} bytes."
    console.log stdout