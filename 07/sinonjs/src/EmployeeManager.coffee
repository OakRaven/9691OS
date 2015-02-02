class window.EmployeeManager
  constructor: (@dataService) ->
    @employees = []

  fetch: ->
    @employees = @dataService.fetchEmployees()

  topEmployee: ->
    comparer = (a, b) ->
      if a.ytdSales >= b.ytdSales
        return a
      else
        return b

    employee = @employees.reduce comparer, { ytdSales: -Infinity }
