url = require 'url'

address = 'http://coffeescript.org:80/?r=home/#loops'
urlInfo = url.parse address, true

for property of urlInfo
  if urlInfo[property]?
    value = JSON.stringify urlInfo[property]
    if value?
      console.log "#{property.toUpperCase()}: #{value}"
