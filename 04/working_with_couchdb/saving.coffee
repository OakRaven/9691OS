cradle = require 'cradle'
db = (new(cradle.Connection)).database 'test'

employees =[
  { id: 1, first: 'Tracy', last: 'Ouellette', salesYtd: 22246 }
  { id: 2, first: 'Chris', last: 'Daniel', salesYtd: 3876 }
  { id: 3, first: 'Jason', last: 'Alexander', salesYtd: 4095 }
  { id: 4, first: 'Jennifer', last: 'Hannah', salesYtd: 8070 }
  { id: 5, first: 'Maxx', last: 'Slayde', salesYtd: 2032 }
]

for employee in employees
  db.save "EMP:#{employee.id}", employee
