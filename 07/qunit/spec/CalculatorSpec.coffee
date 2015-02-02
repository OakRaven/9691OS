pavlov.specify 'Calculator', ->
  calculator = null

  describe 'Adding', ->
    before ->
      calculator = new Calculator()

    it 'should add two numbers', ->
      assert(calculator.add(4, 5)).equals 9

    it 'should add a series of numbers', ->
      assert(calculator.add(1, 2, 3, 4, 5)).equals 15

    it 'should add decimal numbers', ->
      assert(calculator.add(285.72, 142.86)).isCloseTo 428.58, 0.0000001

  describe 'Subtracting', ->
    before ->
      calculator = new Calculator()

    it 'should subtract two numbers', ->
      assert(calculator.subtract(9, 5)).equals 4
