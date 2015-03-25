MillisecondsPerSecond = 1000
MillisecondsPerMinute = MillisecondsPerSecond * 60
MillisecondsPerHour = MillisecondsPerMinute * 60
MillisecondsPerDay  = MillisecondsPerHour * 24
MillisecondsPerWeek = MillisecondsPerDay * 7
MillisecondsPerYear = MillisecondsPerWeek * 52

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

getWeek = (date) ->
  workingDate = new Date(date.valueOf())
  day = (date.getDate() + 6) % 7
  workingDate.setDate(workingDate.getDate() - day + 3)
  jan4 = new Date(date.getFullYear(), 0, 4)
  dayDiff = dateDifference(jan4, workingDate, 'days')

  return 1 + Math.ceil (dayDiff / 7)

now = ->
  return new Date()

today = ->
  now = now()
  return new Date(now.getFullYear(), now.getMonth(), now.getDate())

yesterday = ->
  today = today()
  console.log 'today: ', today
  return dateAdd(today, -1)

tomorrow = ->
  today = today()
  return dateAdd(today, 1)

module.exports =
  dateAdd: dateAdd
  dateDifference: dateDifference
  getWeek: getWeek
  now: now
  today: today
  tomorrow: tomorrow
  yesterday: yesterday