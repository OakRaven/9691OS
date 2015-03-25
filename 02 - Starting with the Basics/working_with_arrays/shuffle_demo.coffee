suits = ['Diamonds', 'Hearts', 'Clubs', 'Spades']
values = ['Ace', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven',
  'Eight', 'Nine', 'Ten', 'Jack', 'Queen', 'King']

assembleDeck = (deck) ->
  for suit in suits
    for value in values
      card = { suit: suit, value: value }
      deck.push card

displayDeck = (deck) ->
  for card in deck[0..4]
    console.log "#{card.value} of #{card.suit}"

getRandomNumber = (maximumValue) ->
  Math.floor (Math.random() * maximumValue)

shuffle = (array) ->
  for i in [1..(array.length * 100)]
    indexOne = getRandomNumber array.length
    indexTwo = getRandomNumber array.length
    tempItem = array[indexOne]
    array[indexOne] = array[indexTwo]
    array[indexTwo] = tempItem

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
