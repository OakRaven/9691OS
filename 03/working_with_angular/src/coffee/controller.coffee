class MyController
  constructor: ($scope) ->
    $scope.title = 'Controllers are Fun'
    $scope.employees = [ {"id": 1, "firstName": "Tracy", "lastName": "Ouellette", "salesYtd": 22246 } , {"id": 2, "firstName": "Chris", "lastName": "Daniel", "salesYtd": 3876} , {"id": 3, "firstName": "Jason", "lastName": "Alexander", "salesYtd": 4095} , {"id": 4, "firstName": "Jennifer", "lastName": "Hannah", "salesYtd": 8070} , {"id": 5, "firstName": "Maxx", "lastName": "Slayde", "salesYtd": 2032}]
    $scope.onClick = (e) ->
      alert 'Thanks!'

demo.app.controller 'myController', MyController
