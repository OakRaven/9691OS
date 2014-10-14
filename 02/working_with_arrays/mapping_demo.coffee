data = require './sample_data'

# Mapping numbers to the squares
numbers = [1, 2, 3, 4, 5, 6]
squares = numbers.map (n) -> n * n
console.log squares

# Mapping words into array of word lengths
words = ['Once', 'upon', 'a', 'time', 'there', 'was', 'a', 'beautiful', 'mountain']
wordLengths = words.map (w) -> w.length
console.log wordLengths

# Mapping employees to collection colection of select list items
getEmployeeListItem = (emp) ->
  return {
    value: emp.id
    text: "#{emp.firstName} #{emp.lastName}"
  }

employeeList = data.employees.map (e) -> getEmployeeListItem e
console.log employeeList