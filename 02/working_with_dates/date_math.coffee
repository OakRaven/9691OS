MillisecondsPerSecond = 1000
MillisecondsPerMinute = MillisecondsPerSecond * 60
MillisecondsPerHour = MillisecondsPerMinute * 60
MillisecondsPerDay  = MillisecondsPerHour * 24
MillisecondsPerWeek = MillisecondsPerDay * 7
MillisecondsPerYear = MillisecondsPerWeek * 52

dateDifference = (startDate, endDate, units = 'days') ->
  elapsed = endDate - startDate
  switch units
    when 'days'
      return elapsed / MillisecondsPerDay
    when 'weeks'
      return elapsed / MillisecondsPerWeek
    when 'months'
      return (elapsed / MillisecondsPerYear) * 12
    when 'years'
      return elapsed / MillisecondsPerYear
    when 'hours'
      return elapsed / MillisecondsPerHour
    when 'minutes'
      return elapsed / MillisecondsPerMinute
    when 'seconds'
      return elapsed / MillisecondsPerSecond

  return elapsed

dateAdd = (date, amount, units = 'days') ->
  workingDate = new Date(date.valueOf())
  switch units
    when 'days'
      workingDate.setDate(date.getDate() + amount)
    when 'weeks'
      workingDate.setDate(date.getDate() + (amount * 7))
    when 'months'
      workingDate.setMonth(date.getMonth() + amount)
    when 'years'
      workingDate.setFullYear(date.getFullYear() + amount)
    when 'hours'
      workingDate.setHours(date.getHours() + amount)
    when 'minutes'
      workingDate.setMinutes(date.getMinutes() + amount)
    when 'seconds'
      workingDate.setSeconds(date.getSeconds() + amount)

  return workingDate

module.exports =
  dateAdd: dateAdd
  dateDifference: dateDifference
