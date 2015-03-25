class Person
  constructor: (@firstName, @lastName) ->

  fullName: ->
    "#{@firstName} #{@lastName}"

  toString: ->
    @fullName()

class Employee extends Person
  constructor: (@id, @firstName, @lastName) ->
    @salesByMonth = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

  totalSales: ->
    @salesByMonth.reduce ((t, n) -> t + n), 0

  toString: ->
    "#{super()} (#{@id})"

  @Departments: [
    'Sales'
    'Customer Service'
    'I.T.', 'Finance'
    'Marketing'
    'Human Resources'
    'Research and Development'
  ]

console.log "Employee class has #{Employee.Departments.length} departments."

emp = new Employee(13, 'Tracy', 'Ouellette')
console.log "#{emp} instance departments? #{emp.Departments}"

class Manager extends Employee
  constructor: (@id, @firstName, @lastName) ->

console.log "Manager class has #{Manager.Departments.length} departments."

# Create a Numbers class wtih a class method
data = require '../working_with_collections/sample_data'

roundWithDecimals = (value, decimalPlaces = 0) ->
  multiplier = Math.pow(10, decimalPlaces)
  return Math.round(value * multiplier) / multiplier

class Numbers
  @avg: (collection) ->
    sum = collection.reduce ((t, n) -> t + n), 0
    sum / collection.length

avgTestScore = Numbers.avg data.testScores
console.log 'Average test score: ', (roundWithDecimals avgTestScore, 2)