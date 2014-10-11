bcu = require './base_conversion_utils'

console.log '153 base 10 to base 2:',
  (bcu.convertToBase2 153)
console.log '10011001 base 2 to base 10:',
  (bcu.convertToBase10 10011001)
console.log '153 base 10 to base 16:',
  (bcu.convertToBase16 153)
console.log '10011001 base 2 to base 16 from base 2:',
  (bcu.convertToBase16 10011001, 2)
console.log '153 base 13 to base 17:',
  (bcu.convertBase 153, 13, 17)