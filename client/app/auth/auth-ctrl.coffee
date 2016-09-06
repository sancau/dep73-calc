###
    Source: auth/controllers/auth-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for the auth view
    Author: Alexander Tatchin | github.com/sancau
###

# controller function
AuthCtrl = ($state) ->

    vm = this

    vm.login = () ->
        
        vm.submitted = on

        console.log 'AUTH LOGIC | NOT IMPLEMENTED'

        $state.go('list') 

    return vm 


# controller registration 
angular.module 'app.auth'
.controller 'AuthCtrl', [
    '$state'

    AuthCtrl
]