
### 
    Users initialize controller.
    If no users exist in the db 
        then populate test admin / user entities
    If db has users -> do nothing / notify 
###

mongoose = require 'mongoose'

module.exports = (app, route) ->

    (req, res) -> 

        UserModel = mongoose.model('user', app.models.user)

        UserModel.find {}, (error, users) ->
            if error then throw error

            if users.length 
                res.json { success: false, error: 'DB already has users' }
                return
            else              
                usersCreds = []
                for username in ['admin', 'user']
                    creds = 
                        username: username
                        password: username
                        admin: username is 'admin' ? true : false

                    usersCreds.push creds 

                for creds in usersCreds
                    testUser = new UserModel creds
                    testUser.save(
                        (error) ->
                            if error then throw error
                            console.log "User created"
                    )

                res.json { success: true }