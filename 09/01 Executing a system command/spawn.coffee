spawn = require('child_process').spawn

coffeeCode = 'console.log "The answer to life is #{6 * 7}"'

echo    = spawn 'echo', [coffeeCode]
coffee  = spawn 'coffee', ['-s']

echo.stdout.on 'data', (data) ->
  coffee.stdin.write data

echo.on 'close', (code) ->
  coffee.stdin.end()

coffee.stdout.on 'data', (data) ->
  displayResult data.toString()

displayResult = (answer) ->
  console.log answer