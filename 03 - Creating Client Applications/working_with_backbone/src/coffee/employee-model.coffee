class Employee extends Backbone.Model

  defaults:
    id: 0
    firstName: ''
    lastName: ''
    salesYtd: 0.0000

  fullName: ->
    "#{@get 'firstName'} #{@get 'lastName'}"

  validate: ->
    return 'First name is required' if (@get 'firstName').length is 0
    return 'Last name is required' if (@get 'lastName').length is 0

class EmployeeList extends Backbone.Collection
  model: Employee

window.app.models.Employee = Employee
window.app.collections.EmployeeList = EmployeeList