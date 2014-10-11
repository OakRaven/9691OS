pad = (value, size, char = ' ', direction = 'left') ->
  padding = ''
  padding += char for i in [0...size]

  switch direction
    when 'left' then return (value + padding).substr(0, size)
    when 'right' then return (padding + value).substr(-1 * size)
    when 'center'
      if value.length > size
        return value.substr(0, size)

      halfPadding = padding.substr(0, (size - value.length) / 2)
      return (halfPadding + value + padding).substr(0, size)


padRight = (size, value, char = ' ') ->
  pad size, value, char, 'right'

padLeft = (size, value, char = ' ') ->
  pad size, value, char, 'left'

alignCenter = (size, value, char = ' ') ->
  pad size, value, char, 'center'

module.exports =
  pad: pad
  padRight: padRight
  padLeft: padLeft
  alignLeft: padLeft
  alignRight: padRight
  center: alignCenter
