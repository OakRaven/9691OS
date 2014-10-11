data = require './sample_data'

# Filtering a collection of numbers for evens/odds
evenScores = (data.testScores.filter (n) -> n % 2 is 0)
oddScores = (data.testScores.filter (n) -> n % 2 isnt 0)
console.log "Even scores: ", evenScores
console.log "Odd scores:  ", oddScores

# Filtering a collection of words for words less than 5 letters
words = 'Once upon a time there was a beautiful mountain'.split ' '
shortWords = (words.filter (w) -> w.length < 5)
console.log "Short words: ", shortWords

# Filtering employees for top sellers
topSellers = (data.employees.filter (e) -> e.salesYtd > 7500)
console.log "Top sellers: ", (topSellers.map (e) -> e.firstName)

# Testing a collection of numbers to see if any are > 40
anyGreaterThan40 = (data.testScores.some (n) -> n > 40)
console.log "Any > 40?    ", anyGreaterThan40

# Testing a collection of numbers to see is ALL are > 40
allGreaterThan40 = (data.testScores.every (n) -> n > 40)
console.log "All > 40?    ", allGreaterThan40

# Testing a collection of numbers to see is ALL are > 20
allGreaterThan20 = (data.testScores.every (n) -> n > 20)
console.log "All > 20?    ", allGreaterThan20
