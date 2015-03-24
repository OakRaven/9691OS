_ = require 'underscore'

employeesData = [
  { id: 1, firstName: 'Tracy', lastName: 'Ouellette', \
    sales: [210340.084, 76251.825, 2967.55, 237934.707, \
      333020.396, 222597.24, 322963.891, 38847.682] }
  { id: 2, firstName: 'Chris', lastName: 'Daniel',  \
    sales: [104362.4195, 70957.9675, 5490.714, \
      242605.2755, 232524.4215, 100582.983, 320185.112, \
      103374.8915] }
  { id: 3, firstName: 'Jason', lastName: 'Alexander',  \
    sales: [226930.102, 72591.8695, 14076.254, \
      229126.6455, 304316.3145, 120713.766, 232629.537, \
      73296.443] }
  { id: 4, firstName: 'Jennifer', lastName: 'Hannah',  \
    sales: [133347.813, 27043.249, 3434.7945, \
      324250.3755, 235481.5525, 94006.9505, 343566.8035, \
      55351.8995] }
  { id: 5, firstName: 'Maxx', lastName: 'Slayde',  \
    sales: [142030.3425, 52111.8295, 5687.95, 244571.772, \
      242079.538, 103000.685, 271688.082, 99726.1815] }
]

employeesFetchAll = ->
  employeesData

employeesFetchById = (id) ->
  _.findWhere employeesData, { id: id }

employeesAddToCollection = (employee) ->
  employee =
    id: employeesNextId()
    firstName: employee.firstName || ''
    lastName: employee.lastName || ''
    sales: employee.sales || []

  employeesData.push employee
  return employee

employeesRemoveFromCollection = (employee) ->
  employeesData = _.reject employeesData, (item) ->
    item.id is employee.id

employeesUpdateExisting = (employee) ->
  employeesRemoveFromCollection employee
  employeesData.push employee

employeesNextId = ->
  _.chain employeesData
    .pluck 'id'
    .max (i) -> i
    .value() + 1

module.exports =
  employees:
    fetchAll: employeesFetchAll
    fetchById: employeesFetchById
    add: employeesAddToCollection
    update: employeesUpdateExisting
    delete: employeesRemoveFromCollection
