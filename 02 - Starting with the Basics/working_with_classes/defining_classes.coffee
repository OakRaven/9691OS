# Create an Employee class
class Employee
  setId: (value) ->
    @id = value

  setFirstName: (value) ->
    @firstName = value

  setLastName: (value) ->
    @lastName = value

displayEmployee = (emp) ->
  console.log "Employee"
  console.log "  id:         ", emp.id
  console.log "  first name: ", emp.firstName
  console.log "  last name:  ", emp.lastName

emp = new Employee()
emp.setId 13
emp.setFirstName 'Tracy'
emp.setLastName 'Ouellette'

displayEmployee emp


# Create an Employee class using a constructor
class Employee
  constructor: () ->
    @id = 0
    @firstName = ''
    @lastName = ''

emp = new Employee()
emp.id = 13
emp.firstName = 'Tracy'
emp.lastName = 'Ouellette'

displayEmployee emp

# Create an Employee class using a constructor with parameters
class Employee
  constructor: (id, firstName, lastName) ->
    @id = id
    @firstName = firstName
    @lastName = lastName


emp = new Employee(13, 'Tracy', 'Ouellette')
displayEmployee emp

# Create an Employee class using a constructor with instance variables
class Employee
  constructor: (@id, @firstName, @lastName) ->

emp = new Employee(13, 'Tracy', 'Ouellette')
displayEmployee emp

# Create an Employee class using a constructor with instance variables
class Employee
  constructor: (@id, @firstName, @lastName) ->
    @salesYtd = 0

emp = new Employee(13, 'Tracy', 'Ouellette')
displayEmployee emp

# Create an Employee class with an instance method
class Employee
  constructor: (@id, @firstName, @lastName) ->
    @salesByMonth = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

  totalSales: ->
    @salesByMonth.reduce ((t, n) -> t + n), 0

emp = new Employee(13, 'Tracy', 'Ouellette')
emp.salesByMonth[0] = 504.43
emp.salesByMonth[1] = 389.56
emp.salesByMonth[2] = 493.23

displayEmployee emp
console.log "  YTD sales:  ", emp.totalSales()
