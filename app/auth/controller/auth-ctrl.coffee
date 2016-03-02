###
    Source: auth/controllers/auth-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for the auth view
    Author: Alexander Tatchin | github.com/sancau
###

# controller function
AuthCtrl = ($scope, $state) ->

    $scope.login = () ->
        $state.go('list')   


# controller registration 
angular.module 'app.auth'
.controller 'AuthCtrl', [
    '$scope'
    '$state'

    AuthCtrl
]