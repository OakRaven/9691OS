window.demo = window.demo || {}

class Employee
  constructor: (emp) ->
    @id = emp.id
    @firstName = emp.firstName
    @lastName = emp.lastName
    @salesYtd = emp.salesYtd

  fullName: ->
    "#{@firstName} #{@lastName}"

window.demo.models =
  Employee: Employee