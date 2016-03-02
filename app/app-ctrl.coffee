###
    Source: app-ctrl.coffee 
    Project: dep73-calc
    Description: Main application controller
    Author: Alexander Tatchin | github.com/sancau
###

# controller function
AppCtrl = ($scope, $location, $state) ->
    # initial pageTitle value
    $scope.pageTitle = "ЦНИИ РТК"

    # associate $state with $scope
    $scope.uiState = $state

    # change of state affects pageTitle value
    $scope.$on '$stateChangeSuccess', (event, toState, toParams, fromState, fromParams) ->
        if angular.isDefined toState.data.pageTitle
            $scope.pageTitle = "#{toState.data.pageTitle} | ЦНИИ РТК"

    # active CSS class handler
    $scope.isActive = (viewLocation) ->
        viewLocation is (do $location.path)

# controller registration
angular.module 'app'
    .controller 'AppCtrl', [
        '$scope' 
        '$location'
        '$state' 
        AppCtrl
    ]
    