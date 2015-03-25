closeTo = (expected, actual, tolerance) ->
  difference = if expected is actual then 0 else \
    Math.abs(expected - actual)

  result = difference <= tolerance

  message = if result
    "#{expected} is close to #{actual}"
  else
    "#{expected} is not close to #{actual}"

  QUnit.push result, expected, actual, message


QUnit.extend QUnit.assert,
  closeTo: closeTo
