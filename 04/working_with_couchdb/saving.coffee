cradle = require 'cradle'
db = (new(cradle.Connection)).database 'blog'

users = [
    id: 'u:mikehatfield'
    type: 'user'
    email: 'mike.hatfield@somedomain.com'
    password: '4QrcOUm6Wau+VuBX8g+IPg=='
    salt: 'a117bd67766d4ca7b1f8131d9fa62089'
    created: '2014-01-10 14:25'
    updated: '2014-01-10 14:25'
  ,
    id: 'u:tracyouellette'
    type: 'user'
    email: 'tracy.ouellette@somedomain.com'
    password: '4QrcOUm6Wau+VuBX8g+IPg=='
    salt: 'a117bd67766d4ca7b1f8131d9fa62089'
    created: '2014-01-10 14:25'
    updated: '2014-01-10 14:25'
  ,
    id: 'u:kenacker'
    type: 'user'
    email: 'ken.acker@somedomain.com'
    password: '4QrcOUm6Wau+VuBX8g+IPg=='
    salt: 'a117bd67766d4ca7b1f8131d9fa62089'
    created: '2014-01-10 14:25'
    updated: '2014-01-10 14:25'
]

saveUser = (user) ->
  db.save user.id, user

saveUser user for user in users