# Create person class, with displayFullName incorrectly bound
class Person
  constructor: (@firstName, @lastName) ->

  displayFullName: ->
    console.log "#{@firstName} #{@lastName}"

person = new Person('Tracy', 'Ouellette')
person.displayFullName()

func = (callback) ->
  callback()

func(person.displayFullName)

# Create person class, with displayFullName correctly bound
class Person
  constructor: (@firstName, @lastName) ->

  displayFullName: =>
    console.log "#{@firstName} #{@lastName}"

person = new Person('Tracy', 'Ouellette')
func(person.displayFullName)