data = require './sample_data'

# Reduce numeric collection to the product of the values
numbers = [1, 2, 3, 4, 5, 6]
reduceToProduct = (total, value) -> total *= value

productOfNumbers = numbers.reduce reduceToProduct, 1
console.log productOfNumbers

# Reduce employees collection to total YTD sales
reduceYtdSales = (total, emp) ->
  total + emp.salesYtd

totalYtdSales = data.employees.reduce reduceYtdSales, 0
console.log totalYtdSales

# Resuce words collection to the longest word
words = ['Once', 'upon', 'a', 'time', 'there', 'was', 'a', 'beautiful', 'mountain']
reduceWords = (value, word) ->
  if word.length > value.length then word else value

longestWord = words.reduce reduceWords, ''
console.log longestWord
