Employee = window.demo.models.Employee

fromJson = (emp) ->
  new Employee(emp)

demo.app.factory 'employeeFactory', ->
  return { fromJson: fromJson }