class window.Calculator
  add: (values...) ->
    sum = 0
    sum += value for value in values
    return sum

