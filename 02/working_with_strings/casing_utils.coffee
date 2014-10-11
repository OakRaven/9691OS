UNCAPITALIZED_WORDS_FOR_TITLECASE = \
  ['a','an','and','but','for','nor','or','the']

capitalizeWord = (word) ->
  word[0].toUpperCase() + word[1..].toLowerCase()

upperSplit = (item) ->
  words = []
  word = ''

  for char in item.split ''
    if /[A-Z]/.test char
      words.push word if word.length
      word = char
    else
      word += char

  words.push word if word.length

  return words

splitStringIntoTokens = (text) ->
  results = []

  for token in text.split /[ _]+/
    token = token.trim()
    words = upperSplit token
    for word in words
      results.push word.toLowerCase()

  results

toTitleCase = (text, wordsToIgnore = UNCAPITALIZED_WORDS_FOR_TITLECASE) ->
  words = splitStringIntoTokens text
  words[0] = capitalizeWord words[0]
  for word, index in words[1..]
    unless word in wordsToIgnore
      words[index+1] = capitalizeWord word

  words.join ' '

toSentenceCase = (text) ->
  words = splitStringIntoTokens text
  words[0] = capitalizeWord words[0]
  words.join ' '

toSnakeCase = (text) ->
  splitStringIntoTokens(text).join '_'

toPascalCase = (text) ->
  (capitalizeWord word for word in splitStringIntoTokens(text)).join ''

toCamelCase = (text) ->
  text = toPascalCase text
  text[0].toLowerCase() + text[1..]

module.exports =
  toSentenceCase: toSentenceCase
  toTitleCase: toTitleCase
  toPascalCase: toPascalCase
  toCamelCase: toCamelCase
  toSnakeCase: toSnakeCase
