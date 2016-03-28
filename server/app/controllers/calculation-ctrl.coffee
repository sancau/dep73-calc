restful = require 'node-restful'

module.exports = (app, route) ->
    # Setup the controller for REST
    endpoint = restful.model(
            'calculation'
            app.models.calculation
        )
        .methods [
            'get'
            'put'
            'post'
            'delete'
        ]

    # Register endpoint middleware
    for method in ['get', 'post', 'put', 'delete']
        endpoint.before method, app.middleware.another

    # Register this endpoint with the application
    endpoint.register(app, route)

    # Return middleware
    return (req, res, next) -> do next
