createEmployee = (id, firstName, lastName) ->
  new app.models.Employee
    id: id
    firstName: firstName
    lastName: lastName
    salesYtd: 0

list = new app.collections.EmployeeList [
  createEmployee 1, 'Mike', 'Hatfield'
  createEmployee 2, 'Tracy', 'Hatfield'
  createEmployee 3, 'Chris', 'Hatfield'
  createEmployee 4, 'Jason', 'Hatfield'
  createEmployee 5, 'Jennifer', 'Hatfield'
]

window.app.data =
  employeeList: list