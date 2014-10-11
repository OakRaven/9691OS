getRandomNumberInRange = (minimum, maximum) ->
  length = (maximum - minimum) + 1
  randomValue = Math.floor((Math.random() * length) + 1)
  return  minimum - 1 + randomValue

getRandomNumber = (maximum) ->
  getRandomNumberInRange 1, maximum

getRandomElementFromCollection = (collection) ->
  randomIndex = getRandomNumber 1, collection.length
  collection[randomIndex]

module.exports =
  getRandomNumber: getRandomNumber
  getRandomNumberInRange: getRandomNumberInRange
  getRandomElementFromCollection: getRandomElementFromCollection