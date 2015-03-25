class Employee
  constructor: (@id, @firstName, @lastName) ->
  fullName: ->
    "#{@firstName} #{@lastName}"

chris = new Employee 1, 'Chris', 'Hatfield'
console.log chris.fullName()