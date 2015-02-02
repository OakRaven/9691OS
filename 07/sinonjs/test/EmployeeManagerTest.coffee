testData =     [
  {name: 'Mike Hatfield', ytdSales: 1000}
  {name: 'Tracy Ouellette', ytdSales: 2000}
  {name: 'Chris Daniels', ytdSales: 1800}
  {name: 'Jason Alexander', ytdSales: 1570}
]

QUnit.module 'Employee Manager',
  beforeEach: ->
    dataService = new DataManager()
    stub = sinon.stub dataService, 'fetchEmployees'
    stub.returns testData

    @manager = new EmployeeManager(dataService)
    @manager.fetch()

QUnit.test 'should load Employee information', (assert) ->
  assert.equal @manager.employees.length, 4

QUnit.test 'should return the top employee with the best YTD sales', (assert) ->
  assert.equal @manager.topEmployee().name, 'Tracy Ouellette'

QUnit.test "should call Data Manager's fetchEmployees method", (assert) ->
  dataService = new DataManager()
  mock = sinon.mock(dataService)\
    .expects('fetchEmployees').once()

  manager = new EmployeeManager(dataService)
  manager.fetch()

  assert.ok mock.verify()
