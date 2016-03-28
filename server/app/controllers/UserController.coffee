restful = require 'node-restful'

module.exports = (app, route) ->
    # Setup the controller for REST
    rest = restful.model(
            'user'
            app.models.user
        )
        .methods [
            'get'
            'put'
            'post'
            'delete'
        ]

    # Register this endpoint with the application
    rest.register(app, route)

    # Return middleware
    return (req, res, next) -> do next
