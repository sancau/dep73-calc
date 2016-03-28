###
    Source: app/server.coffee 
    Project: dep73-calc
    Description: Server API main script
    Author: Alexander Tatchin | github.com/sancau
###

express = require 'express'
bodyParser = require 'body-parser'
methodOverride = require 'method-override'
mongoose = require 'mongoose'
morgan = require 'morgan'

# Create the application
app = do express

# Add some Middleware 
app.use bodyParser.urlencoded({extended: true})
app.use bodyParser.json()
app.use methodOverride('X-HTTP-Method-Override')
app.use morgan 'dev'

# CORS Support
app.use (req, res, next) ->
    res.header('Access-Control-Allow-Origin', '*')
    res.header('Access-Control-Allow-Methods', 'GET, PUT, POST, DELETE')
    res.header('Access-Control-Allow-Headers', 'Content-Type')
    do next

# Connect to MongoDB
mongoose.connect 'mongodb://localhost/dep73-calc'
mongoose.connection.once(
    'open' 
    () -> 
        # Load the models
        app.models = require './models'

        # Load the middleware 
        app.middleware = require './middleware'

        # Load the routes
        routes = require './routes'
        for route, controller of routes 
            app.use route, controller app, route

        app.listen 3000
        console.log 'Listening on port 3000...' 
)