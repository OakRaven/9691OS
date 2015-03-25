app = angular.module 'demoApp', []

app.constant 'DEPARTMENTS', [ 'Sales', 'Customer Service', \
  'I.T.', 'Finance', 'Marketing', 'Human Resources', \
  'Research and Development' ]

app.value 'famousCats', [ 'Garfield', 'Felix', 'Butch', \
  'Duchess', 'Meowth', 'Scratchy' ]

class DepartmentCtrl
  constructor: ($scope, DEPARTMENTS, famousCats) ->
    $scope.title = 'Constant() Demo'
    $scope.departments = DEPARTMENTS.sort()
    $scope.famousCats = famousCats.sort()


app.controller 'departmentCtrl', DepartmentCtrl
