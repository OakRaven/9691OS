fs = require 'fs'
csv = require('csv')

parser = csv.parse { columns: true }

transformer = csv.transform (data) ->
  data.first_name = data.first_name.toUpperCase()
  data.last_name = data.last_name.toUpperCase()
  return data

stringifier = csv.stringify { header: true, quoted: true }

input = fs.createReadStream('us-500.csv')
output = fs.createWriteStream('us-500-upper.csv')

input
  .pipe(parser)
  .pipe(transformer)
  .pipe(stringifier)
  .pipe(output)