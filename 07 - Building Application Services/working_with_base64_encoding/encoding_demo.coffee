encoder = require './encoder'

textToEncode = 'CoffeeScript'

textAsBase64 = encoder.toBase64 textToEncode
textAsAscii  = encoder.fromBase64 textAsBase64

if textToEncode is textAsAscii
  console.log 'Results are equal'
else
  console.log 'Results are not equal'