displayEmployee = (emp) ->
  console.log "Employee"
  console.log "  Id:        ", emp.id
  console.log "  Name:      ", emp.fullName()
  console.log "  YTD sales: ", emp.totalSales()

# Create general person class
class Person
  constructor: (@firstName, @lastName) ->

  fullName: ->
    "#{@firstName} #{@lastName}"

# Create a more specific type of person (Employee)
class Employee extends Person
  constructor: (@id, @firstName, @lastName) ->
    @salesByMonth = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

  totalSales: ->
    @salesByMonth.reduce ((t, n) -> t + n), 0

# Test new employee
emp = new Employee(13, 'Tracy', 'Ouellette')
emp.salesByMonth[0] = 504.43
emp.salesByMonth[1] = 389.56
emp.salesByMonth[2] = 493.23

displayEmployee emp

# Create general person class with a toString() method
class Person
  constructor: (@firstName, @lastName) ->

  fullName: ->
    "#{@firstName} #{@lastName}"

  toString: ->
    @fullName()

# Create an employee class from person, overriding toString()
class Employee extends Person
  constructor: (@id, @firstName, @lastName) ->
    @salesByMonth = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

  totalSales: ->
    @salesByMonth.reduce ((t, n) -> t + n), 0

  toString: ->
    "#{@fullName()} (#{@id})"

# Create employee instance and display
emp = new Employee(13, 'Tracy', 'Ouellette')
console.log "#{emp}"

# Create an employee class from person, overriding toString() with super
class Employee extends Person
  constructor: (@id, @firstName, @lastName) ->
    @salesByMonth = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

  totalSales: ->
    @salesByMonth.reduce ((t, n) -> t + n), 0

  toString: ->
    "#{super()} (#{@id})"

# Create employee instance and display
emp = new Employee(13, 'Tracy', 'Ouellette')
console.log "#{emp}"