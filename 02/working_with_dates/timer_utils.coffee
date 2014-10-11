dm = require './date_math'

formatNumber = (value, decimalPlaces = 0, zeroPadding = 0) ->
  valueParts = (value + '').split '.'
  resultParts = []
  if zeroPadding > 0
    resultParts.push ('0000000000' + valueParts[0]).substr(zeroPadding * -1)
  else
    resultParts.push valueParts[0]

  if decimalPlaces > 0
    resultParts.push (valueParts[1] + '0000000000').substr(0, decimalPlaces)

  return resultParts.join '.'

formatTime = (value) ->
  [hours, minutes, seconds] = [0, 0, value / 1000]
  if seconds > 60
    minutes = Math.floor(seconds / 60)
    seconds -= minutes * 60

  if minutes > 60
    hours = Math.floor(minutes / 60)
    minutes -= hours * 60

  return "#{formatNumber hours, 0, 2}:#{formatNumber minutes, 0, 2}:#{formatNumber seconds, 4, 2}"

displayResults = (results) ->
  [totalTime, minimumTime, maximumTime] = [0, Number.POSITIVE_INFINITY, 0]

  for result in results
    elapsedTime = dm.dateDifference result.start, result.end, 'milliseconds'
    minimumTime = elapsedTime if elapsedTime < minimumTime
    maximumTime = elapsedTime if elapsedTime > maximumTime
    totalTime += elapsedTime

  console.log "Statistics"
  console.log "Times run: #{results.length}"
  console.log "Total:     #{formatTime totalTime}"
  console.log "Minimum:   #{formatTime minimumTime}"
  console.log "Maximum:   #{formatTime maximumTime}"
  console.log "Average:   #{formatTime (totalTime / results.length)}"

timer = (func, numberOfTimesToExecute = 1) ->
  timerResults = []
  console.log 'Running...'

  for lap in [1..numberOfTimesToExecute]
    start = new Date()
    func()
    end = new Date()
    timerResults.push {start: start, end: end}

  displayResults timerResults

module.exports =
  timer: timer