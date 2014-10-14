toSum = (total, number) ->
  total + number

toMaximum = (maximum, number) ->
  if number > maximum then number else maximum

toMinimum = (minimum, number) ->
  if number < minimum then number else minimum

sum = (collection) ->
  collection.reduce toSum, 0

max = (collection) ->
  collection.reduce toMaximum, Number.NEGATIVE_INFINITY

min = (collection) ->
  collection.reduce toMinimum, Number.POSITIVE_INFINITY

avg = (collection) ->
  (sum collection) / collection.length

median = (collection) ->
  return collection[0] if collection.length is 1

  sortedCollection = (collection.sort (a,b) -> a - b)
  midIndex = Math.round(collection.length / 2, 0)
  sortedCollection[midIndex]

variation = (collection) ->
  mean = avg collection
  variances = collection.map ((n) -> return Math.pow(n - mean, 2))
  return (sum variances) / (collection.length - 1)

deviation = (collection) ->
  Math.sqrt (variation collection)

midRange = (collection) ->
  min = min collection
  max = max collection
  return (min + max) / 2

mode = (collection) ->
  reduceCollect = (obj, value) ->
    if obj[value]
      obj[value] += 1
    else
      obj[value] = 1

    return obj

  grouped = collection.reduce reduceCollect, {}
  highestFrequencyCount = 0
  highestFrequencyValue = 0

  for property, count of grouped
    if count > highestFrequencyCount
      highestFrequencyCount = count
      highestFrequencyValue = property

  return highestFrequencyValue


module.exports =
  numeric:
    avg:  avg
    max:  max
    min:  min
    mode: mode
    sum:  sum
    median: median
    midRange: midRange
    variation: variation
    deviation: deviation