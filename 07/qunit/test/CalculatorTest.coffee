QUnit.module 'Adding',
  beforeEach: ->
    @calculator = new Calculator()

QUnit.test 'should add two numbers', (assert) ->
  assert.equal @calculator.add(4, 5), 9

QUnit.test 'should add many numbers', (assert) ->
  assert.equal @calculator.add(1, 2, 3, 4, 5), 15

QUnit.test 'should add decimal numbers', (assert) ->
  assert.closeTo @calculator.add(285.72, 142.86), 428.58, 0

QUnit.module 'Subtracting',
  beforeEach: ->
    @calculator = new Calculator()

QUnit.test 'should subtract two numbers', (assert) ->
  assert.equal @calculator.subtract(9, 5), 4
