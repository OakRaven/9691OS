class AppRouter extends Backbone.Router
  routes:
    ''                             : 'displayList'
    'employees/:id'                : 'displayEmployee'
    'employees/:id/departments/:id': 'displayEmployeeDepartment'
    'payroll/giveRaise/*ids'       : 'giveEmployeesRaise'

  displayList: ->
    ($ '#output-list').append '<li>Displaying employee list.</li>'

  displayEmployee: (id) ->
    ($ '#output-list').append \
      "<li>Displaying employee with id of #{id}</li>"

  displayEmployeeDepartment: (empId, deptId) ->
    ($ '#output-list').append \
      "<li>Displaying employee #{empId}, department #{deptId}</li>"

  giveEmployeesRaise: (ids) ->
    ($ '#output-list').append \
      "<li>Employees #{ids} thank you</li>"

window.app.router = new AppRouter()

Backbone.history.start()

app.router.on 'route:displayEmployee', (id) ->
  alert 'Displaying employee ' + id