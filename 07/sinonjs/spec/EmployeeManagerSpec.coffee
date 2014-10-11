testData =     [
  {name: 'Mike Hatfield', ytdSales: 1000}
  {name: 'Tracy Ouellette', ytdSales: 2000}
  {name: 'Chris Daniels', ytdSales: 1800}
  {name: 'Jason Alexander', ytdSales: 1570}
]

describe 'Employee Manager', ->
  beforeEach ->
    dataService = new DataManager()
    stub = sinon.stub dataService, 'fetchEmployees'
    stub.returns testData

    @manager = new EmployeeManager(dataService)
    @manager.fetch()

  it 'should load Employee information', ->
    expect(@manager.employees.length).toEqual 4

  it 'should return the top employee with the best YTD sales', ->
    expect(@manager.topEmployee().name).toEqual 'Tracy Ouellette'

  it "should call Data Manager's fetchEmployees method", ->
    dataService = new DataManager()
    mock = sinon.mock(dataService)\
      .expects('fetchEmployees').once()

    manager = new EmployeeManager(dataService)
    manager.fetch()

    expect(mock.verify()).toBeTruthy()
