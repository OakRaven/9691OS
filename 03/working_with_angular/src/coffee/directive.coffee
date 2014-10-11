app = angular.module 'demoApp', []

app.directive 'greeting', ->
  restrict: 'EA'
  template: '<div>Welcome from <strong>{{from}}</strong></div>'
  scope:
    from: '@grFrom'
  replace: true