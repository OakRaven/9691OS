data = require './sample_data'

# Sorting strings
console.log 'Sorting Strings'
console.log dept for dept in data.departments.sort()

# Sorting numbers - oops
console.log '\nSorted Values (Incorrect)'
values = [3,63,56,4,65,3,555,9]
console.log value for value in values.sort()

# Sorting numbers - correct
console.log '\nSorted Values (Correct)'
console.log value for value in (values.sort (a,b) -> a - b)

# Sorting numbers in descending order
console.log '\nSorted Values in Descending Order'
console.log value for value in (values.sort (a,b) -> b - a)

# Sorting strings in descending order
console.log '\nSorted Strings in Descending Order'
console.log dept for dept in data.departments.sort().reverse()

# Sorting employees in descending order by YTD sales
displayEmployee = (emp) ->
  console.log "#{emp.firstName}: $#{emp.salesYtd}"

employeeSortBySalesYtd = (a, b) ->
  b.salesYtd - a.salesYtd

console.log '\nEmployees Sorted by YTD Sales'
displayEmployee emp for emp in data.employees.sort(employeeSortBySalesYtd)