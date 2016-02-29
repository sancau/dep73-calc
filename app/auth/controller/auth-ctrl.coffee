###
    Source: auth/controllers/auth-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for the auth view
    Author: Alexander Tatchin | github.com/sancau
###

angular.module 'app.auth'
.controller 'AuthCtrl', [
    '$scope'
    '$state'

    ($scope, $state) ->
        
    	$scope.login = () ->
    		$state.go('list')
]