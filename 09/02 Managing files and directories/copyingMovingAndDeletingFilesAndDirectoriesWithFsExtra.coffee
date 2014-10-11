fs = require 'fs-extra'

# copy only js files
copy = (callback) ->
  fs.copy 'src/js', 'src2/js', '*.js', (err) ->
    return console.error(err) if err
    console.log 'copy: success'
    callback()

# move folder
move = (callback) ->
  fs.move 'src2', 'tmp/src3', (err) ->
    return console.error(err) if err
    console.log 'move: success'
    callback()

# delete a folder
remove = (callback) ->
fs.remove 'tmp', (err) ->
  return console.error(err) if err
  console.log 'remove: success'

copy ->
  move ->
    remove()