app = angular.module 'demoApp', []

app.constant 'DEPARTMENTS', [ 'Sales', 'Customer Service', \
  'I.T.', 'Finance', 'Marketing', 'Human Resources', \
  'Research and Development' ]

app.value 'superHeroes', [ 'Superman', 'Wonderman', 'Spiderman', \
  'Ironman', 'Thor', 'Hulk' ]

app.value 'superHeroes', [ 'Garfield', 'Felix', 'Butch', \
  'Duchess', 'Meowth', 'Scratchy' ]

class DepartmentCtrl
  constructor: ($scope, DEPARTMENTS, superHeroes) ->
    $scope.title = 'Constant() Demo'
    $scope.departments = DEPARTMENTS.sort()
    $scope.superHeroes = superHeroes.sort()


app.controller 'departmentCtrl', DepartmentCtrl