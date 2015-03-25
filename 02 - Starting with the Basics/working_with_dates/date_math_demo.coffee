dm = require './date_math'

zeroPad = (value, length = 2) ->
  return "00000000000000#{value}".split('')[-length..].join('')

formatDate = (date) ->
  year   = date.getFullYear()
  month  = date.getMonth() + 1
  day    = date.getDate()
  hour   = date.getHours()
  minute = date.getMinutes()

  return "#{year}-#{zeroPad month}-#{zeroPad day} #{zeroPad hour}:#{zeroPad minute}"

currentDate = new Date()
newCentury = new Date(2000, 0)

console.log 'Current date: ', formatDate currentDate

console.log 'Days since Jan. 1, 2000: ',
  dm.dateDifference newCentury, currentDate
console.log 'Years since Jan. 1, 2000: ',
  dm.dateDifference newCentury, currentDate, 'years'

console.log '3 days from now: ',
  formatDate dm.dateAdd currentDate, 3
console.log '3 days ago: ',
  formatDate dm.dateAdd currentDate, -3
console.log '3 months from now: ',
  formatDate dm.dateAdd currentDate, 3, 'months'
console.log '3 years from now: ',
  formatDate dm.dateAdd currentDate, 3, 'years'
console.log '3 hours from now: ',
  formatDate dm.dateAdd currentDate, 3, 'hours'
