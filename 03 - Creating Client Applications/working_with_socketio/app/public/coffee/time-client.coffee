$ ->
  socket = io.connect 'http://localhost:8080'
  socket.on 'time', (data) ->
    ($ '#output').html "From the server: #{data.value}"