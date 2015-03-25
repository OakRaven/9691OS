window.demo = window.demo || {}

Employee = demo.models.Employee

class EmployeeCtrl
  constructor: ($scope) ->
    $scope.title = 'Employee List'
    $scope.employees = [
      new Employee { 'id': 1, 'firstName': 'Tracy', \
        'lastName': 'Ouellette', 'salesYtd': 22246 }
      new Employee { 'id': 2, 'firstName': 'Chris', \
        'lastName': 'Daniel', 'salesYtd': 3876 }
      new Employee { 'id': 3, 'firstName': 'Jason', \
        'lastName': 'Alexander', 'salesYtd': 4095 }
      new Employee { 'id': 4, 'firstName': 'Jennifer', \
        'lastName': 'Hannah', 'salesYtd': 8070 }
      new Employee { 'id': 5, 'firstName': 'Maxx', \
        'lastName': 'Slayde', 'salesYtd': 2032 }
    ]

window.demo.app.controller 'employeeCtrl', EmployeeCtrl
