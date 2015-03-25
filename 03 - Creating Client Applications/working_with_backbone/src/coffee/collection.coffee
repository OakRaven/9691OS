Employee = app.models.Employee

class EmployeeList extends Backbone.Collection
  model: Employee

app.collections.EmployeeList = EmployeeList