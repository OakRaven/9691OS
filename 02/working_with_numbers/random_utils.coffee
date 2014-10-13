getRandomNumberInRange = (minimum, maximum) ->
  length = maximum - minimum + 1
  randomValue = Math.floor (Math.random() * length)
  minimum + randomValue

getRandomNumber = (maximum) ->
  getRandomNumberInRange 1, maximum

getRandomElementFromCollection = (collection) ->
  randomIndex = getRandomNumberInRange 0, collection.length - 1
  collection[randomIndex]

module.exports =
  getRandomNumber: getRandomNumber
  getRandomNumberInRange: getRandomNumberInRange
  getRandomElementFromCollection: getRandomElementFromCollection
