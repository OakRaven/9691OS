caseUtils = require './casing_utils'

console.log 'Title:', caseUtils.toTitleCase 'an author and his book'
console.log 'Sentence:', caseUtils.toSentenceCase 'this should be in sentence case'
console.log 'Pascal:', caseUtils.toPascalCase 'this should be in pascal case'
console.log 'Camel:', caseUtils.toCamelCase 'this should be in camel case'
console.log 'Snake:', caseUtils.toSnakeCase 'this should be in snake case'
