window.app = window.app || {}

employeeDS = new kendo.data.DataSource
  data: [
    { 'id': 1, 'firstName': 'Tracy', 'lastName': 'Ouellette', 'salesYtd': 22246 }
    { 'id': 2, 'firstName': 'Chris', 'lastName': 'Daniel', 'salesYtd': 3876 }
    { 'id': 3, 'firstName': 'Jason', 'lastName': 'Alexander', 'salesYtd': 4095 }
    { 'id': 4, 'firstName': 'Jennifer', 'lastName': 'Hannah', 'salesYtd': 8070 }
    { 'id': 5, 'firstName': 'Maxx', 'lastName': 'Slayde', 'salesYtd': 2032 }
  ]
  sort:
    field: 'salesYtd'
    dir: 'desc'
  aggregate: [
    { field: 'salesYtd', aggregate: 'count' }
    { field: 'salesYtd', aggregate: 'sum' }
  ]

employeeDS.fetch ->
  employeeDS.aggregates().salesYtd

app.data =
  employeeDS: employeeDS