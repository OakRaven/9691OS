cradle = require 'cradle'
db = (new(cradle.Connection)).database 'blog'

db.exists (err, exists) ->
  if exists
    console.log 'blog database exists'
  else
    console.log 'blog database does not exist'
    db.create()
    console.log 'blog database has been created'


{
  id: 'user-mikehatfield'
  type: 'user'
  username: 'mikehatfield'
  password: '4QrcOUm6Wau+VuBX8g+IPg=='
  salt: 'a117bd67766d4ca7b1f8131d9fa62089'
  email: 'mike.hatfield@somedomain.com'
}
{
  id: 'article-mikehatfiled-20140119'
  type: 'article'
  author: 'user-mikehatfield'
  content: '...'
  tags: [
    'CoffeeScript', 'Programming', 'Introduction'
  ]
  status: 'published'
  created: '2014-01-19 09:33:00'
  updated: '2014-01-19 09:33:00'
  comments: [
    {
      content: '...'
      status: 'approved'
      email: 'jsmith@here.com'
      created: '2014-01-19 09:33:00'
    }
  ]
}
  articles: [
    {
      id: '20140119'
      title: 'Welcome to CoffeeScript'
      content: '...'
      tags: [
        'CoffeeScript', 'Programming', 'Introduction'
      ]
      status: 'published'
      created: '2014-01-19 09:33:00'
      updated: '2014-01-19 09:33:00'
      comments: [
        {
          content: '...'
          status: 'approved'

        }
      ]
    }
  ]
}