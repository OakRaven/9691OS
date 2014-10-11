fs = require 'fs'
csv = require('csv')

countsByState = []
parser = csv.parse { columns: true }

parser.on 'readable', ->
  while record = parser.read()
    addOrIncrement record, countsByState

parser.on 'end', ->
  displayTopResults countsByState

addOrIncrement = (record, countsByState) ->
  items = countsByState.filter (item) -> item.state is record.state
  if items.length is 1
    items[0].count += 1
  else
    countsByState.push { state: record.state, count: 1 }

sumOfCounts = (array) ->
  sum = 0
  sum += item.count for item in array
  return sum

displayTopResults = (countsByState, n = 5) ->

  sortByDescComparer = (a, b) ->
    if b.count > a.count then return 1
    if a.count > b.count then return -1
    return 0

  sorted = countsByState.sort sortByDescComparer

  topN = sorted[0...n]

  console.log '\nTop Results\n-----------'
  for item in topN
    console.log "#{item.state}: #{item.count}"

  sumOfTopNCount = sumOfCounts topN
  sumOfAll = sumOfCounts countsByState

  console.log "\nTop #{n} of #{countsByState.length} states " + \
    "account for #{(sumOfTopNCount / sumOfAll) * 100} %\n"

# kick off our processing
fs.createReadStream('us-500.csv').pipe(parser)