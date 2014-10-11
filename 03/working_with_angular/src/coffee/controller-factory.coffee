Employee = demo.models.Employee

class FactoryCtrl
  constructor: ($scope, employeeFactory) ->
    $scope.title = 'Employee from a Factory'
    $scope.emp = employeeFactory.fromJson({
      id: 1
      firstName: 'Tracy'
      lastName: 'Ouellette'
      salesYtd: 22246
    })

demo.app.controller 'factoryCtrl', FactoryCtrl