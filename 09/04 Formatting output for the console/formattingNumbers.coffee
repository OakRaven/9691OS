accounting = require 'accounting'

# formatting as currency (default formatting)
console.log accounting.formatMoney 31415.9535
console.log accounting.formatMoney([100, 200, 300])

# format as money with British pound
console.log accounting.formatMoney 31415.9535, { symbol: '£' }

# format as money precision of 3
console.log accounting.formatMoney 31415.9535, { precision: 3 }

# format as money column
console.log accounting.formatColumn([1025, 2500, 300])
options =
  symbol: '€'
  format: '%s %v'
console.log accounting.formatColumn([1025, 2500, 300], options)

# format as number
console.log accounting.formatNumber 31415.9535
console.log accounting.formatNumber([100, 200, 300])

# toFixed
console.log (0.615).toFixed(2)
console.log accounting.toFixed 0.615, 2
console.log accounting.toFixed 31415.9535, 3
