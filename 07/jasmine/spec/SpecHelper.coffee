beforeEach ->
  jasmine.addMatchers
    toBeCloseTo: ->
      return compare : (expected, value, tolerance) ->
        result =
          pass: expected + tolerance >= value \
            and expected - tolerance <= value

        if result.pass
          result.message = "#{expected} is close to #{value}"
        else
          result.message = "#{expected} is not close to #{value}"

        return result
