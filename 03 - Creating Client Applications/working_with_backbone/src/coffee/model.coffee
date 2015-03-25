class Employee extends Backbone.Model
  defaults:
    id: 0
    firstName: ''
    lastName: ''
    salesYtd: 0.0000

  fullName: ->
    "#{@get 'firstName'} #{@get 'lastName'}"

  validate: ->
    return 'First name required' if (@get 'firstName').length is 0
    return 'Last name required' if (@get 'lastName').length is 0

window.app.models.Employee = Employee