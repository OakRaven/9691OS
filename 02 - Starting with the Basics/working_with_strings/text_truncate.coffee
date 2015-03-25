truncateText = (text, maxLineWidth = 80, ellipsis = '...') ->
    maxLineWidth -= ellipsis.length
    regex = RegExp \
      ".{1,#{maxLineWidth}}(\\s|$)|\\S+?(\\s|$)", 'g'
    "#{text.match(regex)[0].trim()}#{ellipsis}"

homersOdessy = 'He counted his goodly coppers and cauldrons, his gold and all his clothes, but there was nothing missing;'

console.log (truncateText homersOdessy, 40)
