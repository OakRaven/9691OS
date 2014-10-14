data = require './sample_data'

# Filtering a collection of numbers for evens/odds
evenScores = (i for i in data.testScores when i % 2 is 0)
oddScores = (i for i in data.testScores when i % 2 isnt 0)
console.log "Even scores: ", evenScores
console.log "Odd scores:  ", oddScores

# Filtering a collection of words for words less than 5 letters
words = 'Once upon a time there was a beautiful mountain'.split ' '
shortWords = (w for w in words when w.length < 5)
console.log "Short words: ", shortWords

# Filtering employees for top sellers
topSellers = (e for e in data.employees when e.salesYtd > 7500)
console.log "Top sellers: ", (topSellers.map (e) -> e.firstName)

any = (array, testFunc) ->
  matches = (m for m in array when testFunc m)
  matches.lenngth isnt 0

all = (array, testFunc) ->
  matches = (m for m in array when testFunc m)
  matches.length is array.length

# Testing a collection of numbers to see if any are > 40
anyGreaterThan40 = any data.testScores, (n) -> n > 40
console.log "Any > 40?    ", anyGreaterThan40

# Testing a collection of numbers to see is ALL are > 40
allGreaterThan40 = all data.testScores, (n) -> n > 40
console.log "All > 40?    ", allGreaterThan40

# Testing a collection of numbers to see is ALL are > 20
allGreaterThan20 = all data.testScores, (n) -> n > 20
console.log "All > 20?    ", allGreaterThan20
