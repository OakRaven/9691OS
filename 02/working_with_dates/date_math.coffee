MILLISECONDS_PER_SECOND = 1000
MILLISECONDS_PER_MINUTE = MILLISECONDS_PER_SECOND * 60
MILLISECONDS_PER_HOUR = MILLISECONDS_PER_MINUTE * 60
MILLISECONDS_PER_DAY  = MILLISECONDS_PER_HOUR * 24
MILLISECONDS_PER_WEEK = MILLISECONDS_PER_DAY * 7
MILLISECONDS_PER_YEAR = MILLISECONDS_PER_WEEK * 52

dateDifference = (startDate, endDate, units = 'days') ->
  elapsed = endDate - startDate
  switch units
    when 'days'
      return elapsed / MILLISECONDS_PER_DAY
    when 'weeks'
      return elapsed / MILLISECONDS_PER_WEEK
    when 'months'
      return elapsed / MILLISECONDS_PER_YEAR * 12
    when 'years'
      return elapsed / MILLISECONDS_PER_YEAR
    when 'hours'
      return elapsed / MILLISECONDS_PER_HOUR
    when 'minutes'
      return elapsed / MILLISECONDS_PER_MINUTE
    when 'seconds'
      return elapsed / MILLISECONDS_PER_SECOND

  return elapsed

dateAdd = (date, amount, units = 'days') ->
  workingDate = new Date(date.valueOf())
  switch units
    when 'days'
      workingDate.setDate date.getDate() + amount
    when 'weeks'
      workingDate.setDate date.getDate() + amount * 7
    when 'months'
      workingDate.setMonth date.getMonth() + amount
    when 'years'
      workingDate.setFullYear date.getFullYear() + amount
    when 'hours'
      workingDate.setHours date.getHours() + amount
    when 'minutes'
      workingDate.setMinutes date.getMinutes() + amount
    when 'seconds'
      workingDate.setSeconds date.getSeconds() + amount

  return workingDate

module.exports =
  dateAdd: dateAdd
  dateDifference: dateDifference
