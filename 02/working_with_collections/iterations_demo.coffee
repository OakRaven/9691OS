data = require './sample_data'

# Listing Employees
for employee in data.employees
  console.log "Employee No. #{employee.id}: #{employee.firstName}"

# Listing Employee, Again
displayEmployee = (emp) ->
  console.log "Employee No. #{emp.id}: #{emp.firstName}"

displayEmployee employee for employee in data.employees

# Listing with optional index
console.log "Dept #{index + 1}: #{dept}" for dept, index in data.departments

# Grading employees
gradeSales = (emp) ->
  switch
    when emp.salesYtd > 10000 then 'A'
    when emp.salesYtd > 7500 then 'B'
    when emp.salesYtd > 5000 then 'C'
    when emp.salesYtd > 3000 then 'D'
    else 'F'

# Works, but messy
(if (gradeSales emp) is 'F' then (console.log "#{emp.firstName} needs to do better.")) for emp in data.employees

# Much cleaner
evaluateEmployee = (emp) ->
  if (gradeSales emp) is 'F'
    console.log "#{emp.firstName} needs to do better."

evaluateEmployee emp for emp in data.employees