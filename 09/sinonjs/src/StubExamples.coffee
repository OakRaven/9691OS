sinon = require '../lib/sinon'

trueStub = sinon.stub().returns true

rosesAreRed = (predicate) ->
  if predicate()
    console.log 'Yes, roses are red.'
  else
    console.log 'No, roses are not red.'

rosesAreRed trueStub

