class Employee
  constructor: () ->
    @id = 0
    @firstName = ''
    @lastName = ''
    @salesYtd = 0.00

  fullName: ->
    "#{@firstName} #{@lastName}"

  init: (emp) ->
    @id = emp.id
    @firstName = emp.firstName
    @lastName = emp.lastName
    @salesYtd = emp.salesYtd

demo.app.service 'employeeService', Employee