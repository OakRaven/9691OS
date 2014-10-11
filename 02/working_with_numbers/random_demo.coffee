random = require './random_utils'

console.log 'Random number between 1 and 1,000:',
  (random.getRandomNumber 1000)
console.log 'Random number between 10 and 50:',
  (random.getRandomNumberInRange 10, 50)
console.log "Random element from ['Cat', 'Dog', 'Hamster']:",
  (random.getRandomElementFromCollection ['Cat', 'Dog', 'Hamster'])
