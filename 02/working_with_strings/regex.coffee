# SPLIT() USING A REGULAR EXPRESSION
whiteSpaceRegex = /[ \t\n]/

words = "A happy\tday\nis here"
console.log "Value:", words
console.log (words.split whiteSpaceRegex)

# REPLACE() USING A REGULAR EXPRESSION
phrase = 'The blue balloon is bright'
console.log "Red balloon:", (phrase.replace /blue/, 'red')

# TEST() USING A REGULAR EXPRESSING
validIpAddress = '192.168.10.24'
invalidIpAddress = '192.168-10.24'
testRegex = /\d+\.\d+\.\d+\.\d+/
console.log "#{validIpAddress} valid?", (testRegex.test validIpAddress)
console.log "#{invalidIpAddress} valid?", (testRegex.test invalidIpAddress)