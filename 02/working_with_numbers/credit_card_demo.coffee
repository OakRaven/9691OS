ccv = require './credit_card_validator'

# VALID CARD NUMBERS
visa1Sample = '4012888888881881'
mc1Sample = '5105105105105100'

# INVALID CARD NUMBERS
visa2Sample = '4012788888881881'
mc2Sample = '5555655555554444'

console.log "#{visa1Sample} valid? ",
  (ccv.isValidCreditCardNumber visa1Sample)
console.log "#{mc1Sample} valid? ",
  (ccv.isValidCreditCardNumber mc1Sample)
console.log "#{visa2Sample} valid? ",
  (ccv.isValidCreditCardNumber visa2Sample)
console.log "#{mc2Sample} valid? ",
  (ccv.isValidCreditCardNumber mc2Sample)