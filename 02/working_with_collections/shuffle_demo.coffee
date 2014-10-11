ru = require '../working_with_numbers/random_utils'

suits = ['Diamonds', 'Hearts', 'Clubs', 'Spades']
values = ['Ace', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven',
  'Eight', 'Nine', 'Ten', 'Jack', 'Queen', 'King']

assembleDeck = (deck) ->
  for suit in suits
    for value in values
      card = { suit: suit, value: value }
      deck.push card

displayDeck = (deck) ->
  for i in [0..4]
    card = deck[i]
    console.log "#{card.value} of #{card.suit}"

shuffle = (collection) ->
  for i in [1..(collection.length * 100)]
    indexOne = (ru.getRandomNumber collection.length) - 1
    indexTwo = (ru.getRandomNumber collection.length) - 1
    tempItem = collection[indexOne]
    collection[indexOne] = collection[indexTwo]
    collection[indexTwo] = tempItem

deck = []
assembleDeck deck

# Before shuffle
console.log 'Before Shuffle:'
displayDeck deck

# Perform shuffle
console.log '\nShuffling...\n'
shuffle deck

# After shuffle
console.log 'After Shuffle:'
displayDeck deck
