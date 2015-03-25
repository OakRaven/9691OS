dm = require './date_math'

padRight = (value, zeroPadding) ->
  "00000000000000#{value}".split('')[-zeroPadding..].join('')

padLeft =  (value, zeroPadding) ->
  "#{value}00000000000000"[0...zeroPadding]

formatNumber = (value, decimalPlaces = 0, zeroPadding = 0) ->
  valueParts = (value + '').split '.'
  resultParts = []
  resultParts.push padRight valueParts[0], zeroPadding
  if decimalPlaces
    resultParts.push padLeft valueParts[1], decimalPlaces

  return resultParts.join '.'

formatTime = (value) ->
  hours   = 0
  minutes = 0
  seconds = value / 1000

  if seconds > 60
    minutes = Math.floor seconds / 60
    seconds -= minutes * 60

  if minutes > 60
    hours = Math.floor minutes / 60
    minutes -= hours * 60

  return "#{formatNumber hours, 0, 2}:" + \
    "#{formatNumber minutes, 0, 2}:" + \
    "#{formatNumber seconds, 4, 2}"

displayResults = (results) ->
  totalTime   = 0
  minimumTime = Number.POSITIVE_INFINITY
  maximumTime = 0

  for elapsedTime in results
    minimumTime = elapsedTime if elapsedTime < minimumTime
    maximumTime = elapsedTime if elapsedTime > maximumTime
    totalTime += elapsedTime

  console.log "Statistics"
  console.log "Times run: #{results.length}"
  console.log "Total:     #{formatTime totalTime}"
  console.log "Minimum:   #{formatTime minimumTime}"
  console.log "Maximum:   #{formatTime maximumTime}"
  console.log "Average:   #{formatTime totalTime / results.length}"

timer = (func, numberOfTimesToExecute = 1) ->
  timerResults = []
  console.log 'Running...'

  for lap in [1..numberOfTimesToExecute]
    start = new Date()
    func()
    end = new Date()
    timerResults.push \
      dm.dateDifference(start, end, 'milliseconds')

  displayResults timerResults

module.exports =
  timer: timer
