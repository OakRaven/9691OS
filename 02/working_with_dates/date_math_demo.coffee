dm = require './date_math'

zeroPad = (value, width = 2) ->
  return "00000000000000#{value}".substr(-1 * width)

formatDate = (date) ->
  [year, month, day, hour, minute] = [
    date.getFullYear()
    date.getMonth() + 1
    date.getDate()
    date.getHours()
    date.getMinutes()
  ]
  return "#{year}-#{zeroPad month}-#{zeroPad day} #{zeroPad hour}:#{zeroPad minute}"

currentDate = new Date()
newCentury = new Date(2000, 0)

console.log 'Current date: ', (formatDate currentDate)

console.log 'Days since Jan. 1, 2000: ',
  (dm.dateDifference newCentury, currentDate)
console.log 'Years since Jan. 1, 2000: ',
  (dm.dateDifference newCentury, currentDate, 'years')

console.log '3 days from now: ',
  formatDate(dm.dateAdd currentDate, 3)
console.log '3 days ago: ',
  formatDate(dm.dateAdd currentDate, -3)
console.log '3 months from now: ',
  formatDate(dm.dateAdd currentDate, 3, 'months')
console.log '3 years from now: ',
  formatDate(dm.dateAdd currentDate, 3, 'years')
console.log '3 hours from now: ',
  formatDate(dm.dateAdd currentDate, 3, 'hours')