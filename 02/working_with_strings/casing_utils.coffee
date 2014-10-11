capitalizeWord = (word) ->
  (word.substr 0, 1).toUpperCase() + (word.substr 1).toLowerCase()

splitStringIntoTokens = (text) ->
  results = []

  upperSplit = (item) ->
    words = []
    word = ''

    for char in (item.split '')
      if (/[A-Z]/.test char)
        words.push word if word.length > 0
        word = char
      else
        word += char

    words.push word if word.length > 0

    return words

  for token in text.split /[ _]+/
    token = token.trim()
    words = upperSplit token
    for word in words
      results.push word.toLowerCase()

  results

toTitleCase = (text) ->
  wordsToIgnore = '|a|an|and|but|for|nor|or|the |'
  words = splitStringIntoTokens text
  words[0] = capitalizeWord words[0]
  for index in [1...words.length]
    if (wordsToIgnore.indexOf "|#{words[index]}|") < 0
      words[index] = capitalizeWord words[index]

  words.join ' '

toSentenceCase = (text) ->
  words = splitStringIntoTokens text
  words[0] = capitalizeWord words[0]
  words.join ' '

toSnakeCase = (text) ->
  words = splitStringIntoTokens text
  words.join '_'

toPascalCase = (text) ->
  words = (capitalizeWord word for word in (splitStringIntoTokens text))
  words.join ''

toCamelCase = (text) ->
  text = toPascalCase text
  text.substr(0, 1).toLowerCase() + text.substr(1)

module.exports =
  toSentenceCase: toSentenceCase
  toTitleCase: toTitleCase
  toPascalCase: toPascalCase
  toCamelCase: toCamelCase
  toSnakeCase: toSnakeCase
