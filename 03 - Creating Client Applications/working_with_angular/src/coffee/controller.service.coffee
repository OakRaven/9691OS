Employee = demo.models.Employee

class ServiceCtrl
  constructor: ($scope, employeeService) ->
    $scope.title = 'Employee from a Service'
    $scope.emp = employeeService.init({
      id: 1
      firstName: 'Tracy'
      lastName: 'Ouellette'
      salesYtd: 22246
    })

demo.app.controller 'serviceCtrl', ServiceCtrl