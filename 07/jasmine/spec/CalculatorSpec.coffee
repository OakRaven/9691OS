describe 'Calculator', ->
  describe 'Adding Numbers', ->

    beforeEach ->
      @calculator = new Calculator()

    it 'should add two numbers', ->
      expect(@calculator.add 4, 5).toEqual 9

    it 'should add a series of numbers', ->
      expect(@calculator.add 2, 3, 4, 5).toEqual 14

    it 'should add decimal values', ->
      expect(@calculator.add 0.01, 0.05).toBeCloseTo 0.06, 0.000000001