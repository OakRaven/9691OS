fs = require 'fs'
archiver = require 'archiver'

output = fs.createWriteStream 'backup.zip'
archive = archiver('zip')

output.on 'close', ->
  console.log "Total bytes: #{archive.pointer()}"

archive.on 'error', (err) ->
  console.error err

archive.pipe output
archive.bulk
  expand: true
  cwd: 'workspace'
  src: ['**']
  dest: 'workspace'
archive.finalize()