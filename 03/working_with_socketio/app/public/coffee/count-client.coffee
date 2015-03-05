$ ->
  socket = io.connect 'http://localhost:8080'
  socket.on 'update', (data) ->
    $('#output').html "From the server: #{data.value}"

  $('button#add-1000').click ->
    socket.emit 'add', { amount: 1000 }

  $('button#add-500').click ->
    socket.emit 'add', { amount: 500 }

  $('button#disconnect').click ->
    socket.disconnect()
