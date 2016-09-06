###
    Source: app/controllers/login-ctrl.coffee 
    Project: dep73-calc
    Description: Authentication endpoint logic controller
                 Using JWT authentication
    Author: Alexander Tatchin | github.com/sancau
###

mongoose = require 'mongoose'
jwt = require 'jsonwebtoken'

module.exports = (app, route) ->

    (req, res) -> 

        if req.method isnt 'POST'
            res.json { success: false, message: "Accepts POST requests only, #{req.method} received." }
        else       
            UserModel = mongoose.model('user', app.models.user)

            query = 
                username: req.body.username

            UserModel.findOne query, (error, user) ->

                if error then throw error

                if not user
                    response = 
                        success: false
                        message: 'User not found.'

                    res.json response
                else
                    if user.password != req.body.password 
                        response = 
                            success: false
                            message: 'Wrong password.'

                        res.json response
                    else
                        # secret should not be here hardcoded -_-
                        tokenConf = 
                            expiresInMinutes: 1440 # 24 hours

                        token = jwt.sign user, 'secret', tokenConf

                        response = 
                            success: true
                            message: 'Success. Token provided.'
                            token: token

                        res.json response
