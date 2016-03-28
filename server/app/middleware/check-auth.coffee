###
    Source: app/middleware/check-auth.coffee 
    Project: dep73-calc
    Description: Middleware to check auth JWT token 
    Author: Alexander Tatchin | github.com/sancau
###

jwt = require 'jsonwebtoken'

module.exports = (req, res, next) ->
    token = req.body.token or 
            req.query.token or 
            req.headers['x-access-token']
    
    if token 
            
        # secret key should be configured at one place and then shared
        jwt.verify token, 'secret', (error, decoded) ->
            if error
                response = 
                    success: false
                    message: 'Authentication failed.'

                return res.json response
            else
                req.decoded = decoded
                do next
    else
        response = 
            success: false
            message: 'No authentication token provided. Access denied.'
        res
            .status 403
                .send response