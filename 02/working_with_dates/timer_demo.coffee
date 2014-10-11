tu = require './timer_utils'

test = () ->
  for i in [1..1000000]
    d = new Date()

tu.timer test, 5