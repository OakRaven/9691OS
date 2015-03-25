app = angular.module 'demoApp', ['ngRoute']

app.controller 'pageAController', \
  ($scope, $routeParams) ->
    $scope.id = $routeParams.id

app.controller 'pageBController', \
  ($scope, $routeParams) ->
    $scope.id = $routeParams.id

app.config ($routeProvider) ->
  $routeProvider
    .when '/page-a/:id',
      templateUrl: '/partials/page-a.html'
      controller: 'pageAController'
    .when '/page-b/:id',
      templateUrl: '/partials/page-b.html'
      controller: 'pageBController'