###
    Source: app/models/user.coffee 
    Project: dep73-calc
    Description: User db model
    Author: Alexander Tatchin | github.com/sancau
###

mongoose = require 'mongoose'

UserSchema = new mongoose.Schema(
        username: 
            type: String
            required: true
        password: 
            type: String
            required: true
        admin: 
            type: Boolean
            required: true
    )

module.exports = UserSchema