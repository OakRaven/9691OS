fs = require 'fs'

src = 'chinook.sqlite'
dest = 'chinook2.sqlite'

# copy from a read stream into a write stream
fs.createReadStream(src).pipe  fs.createWriteStream(dest)

# rename a file
fs.rename 'chinook2.sqlite', 'chinook3.sqlite', (err) ->
  return console.error(err) if err
  console.log 'rename file: success'

# rename a folder
fs.rename 'src', 'src2', (err) ->
  return console.error(err) if err
  console.log 'rename directory: success'

# create a folder
fs.mkdir 'new-dir', (err) ->
  return console.error(err) if err
  console.log 'mkdir: success'

# remove a folder
fs.rmdir 'new-dir', (err) ->
  return console.error(err) if err
  console.log 'rmdir: success'

# remove a file
fs.unlink 'chinook3.sqlite', (err) ->
  return console.error(err) if err
  console.log 'unlink: success'

# remove non-empty directory
fs.rmdir 'src', (err) ->
  return console.error(err) if err
  console.log 'rmdir non-empty directory: success'

# create a recursive function to delete a folder and its contents
deleteFolderAndContents  = (path) ->
  if fs.existsSync(path)
    fs.readdirSync(path).forEach (file,index) ->
      currentPath = "#{path}/#{file}"
      if fs.statSync(currentPath).isDirectory()
        deleteFolderAndContents  currentPath
      else
        fs.unlinkSync currentPath

    fs.rmdirSync path