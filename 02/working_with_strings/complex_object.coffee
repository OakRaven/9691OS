class Employee
  constructor: (@firstName, @lastName, @empNum) ->
  toString: ->
    return "#{@firstName} #{@lastName} (No: #{@empNum})"

employee = new Employee('Tracy', 'Ouellette', 876)
console.log "Employee Info: #{employee}"