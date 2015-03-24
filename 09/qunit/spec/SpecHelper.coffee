pavlov.specify.extendAssertions
  isCloseTo: (actual, expected, tolerance, message) ->
    difference = Math.abs(expected - actual)
    ok difference <= tolerance, message
