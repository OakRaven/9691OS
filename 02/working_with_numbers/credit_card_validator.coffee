reduceNumber = (number) ->
  value = 0
  digits = []
  digits.push(Number x) for x in number.toString().split('')
  value += digit for digit in digits

  if value > 9
    return reduceNumber value
  else
    return value

calculateCheckDigit = (creditCardNumber) ->
  value = 0
  index = 0
  digits = []
  digits.push(Number x) for x in creditCardNumber.split ''
  for digit in digits.reverse()
    if index % 2 is 1
      value += reduceNumber digit * 2
    else
      value += digit
    index += 1

  return value

isValidCreditCardNumber = (cardNumber) ->
  calculateCheckDigit(cardNumber) % 10 is 0

module.exports =
  isValidCreditCardNumber: isValidCreditCardNumber
