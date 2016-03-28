restful = require 'node-restful'

module.exports = (app, route) ->
    # Setup the controller for REST
    endpoint = restful.model(
            'preset'
            app.models.preset
        )
        .methods [
            'get'
            'put'
            'post'
            'delete'
        ]

    # Register this endpoint with the application
    endpoint.register(app, route)

    # Return middleware
    return (req, res, next) -> do next