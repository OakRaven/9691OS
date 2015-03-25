express    = require 'express'
bodyParser = require 'body-parser'
data       = require './data'
routes     = require './routes'
app        = express()

app.use bodyParser.urlencoded({ extended: true })

routes.registerRoutes app, data

console.log 'Ready on port 3000.  Press [Ctrl+C] to stop.'
app.listen 3000