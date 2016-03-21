###
    Source: auth/controllers/auth-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for the auth view
    Author: Alexander Tatchin | github.com/sancau
###

# controller function
AuthCtrl = ($state, AppConfig) ->

    vm = this

    vm.login = () ->
        
        vm.submitted = on

        if not vm.form.username
            return 
        
        userData = 
            username: vm.form.username

        AppConfig.userData = userData

        $state.go('list') 

    return vm 


# controller registration 
angular.module 'app.auth'
.controller 'AuthCtrl', [
    '$state'
    'AppConfig'

    AuthCtrl
]