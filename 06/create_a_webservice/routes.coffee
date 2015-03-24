module.exports =
  registerRoutes: (app, data) ->

    app.get '/api/employees', (req, res) ->
      res.json data.employees.fetchAll()

    app.get '/api/employees/:id', (req, res) ->
      employee = data.employees.fetchById Number req.params.id
      if employee
        res.json employee
      else
        res.send(404, 'Resource not found.')

    app.get '/api/employees/:id/sales', (req, res) ->
      employee = data.employees.fetchById Number req.params.id
      if employee
        res.json employee.sales || []
      else
        res.send(404, 'Resource not found.')

    app.post '/api/employees', (req, res) ->
      employee = data.employees.add req.body
      res.json employee

    app.post '/api/employees/:id', (req, res) ->
      employee = data.employees.fetchById Number req.params.id
      if employee
        if req.body.firstName
          employee.firstName = req.body.firstName
        if req.body.lastName
          employee.lastName = req.body.lastName

        data.employees.update employee
        res.json employee
      else
        res.send(404, 'Resource not found.')

    app.post '/api/employees/:id/delete', (req, res) ->
      employee = data.employees.fetchById Number req.params.id
      if employee
        data.employees.delete employee
        res.json employee
      else
        res.send(404, 'Resource not found.')
