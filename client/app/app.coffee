###
    Source: app.coffee 
    Project: dep73-calc
    Description: Main application module
    Author: Alexander Tatchin | github.com/sancau
###

angular.module 'app', [
    'ui.bootstrap'
    'ui.router'
    
    'ngAnimate'
    'ngResource'

    'lc.directives' 

    'app.auth'
    'app.calculation' 
    'app.settings'
    'app.views' 
]

.config [
    '$stateProvider'
    '$urlRouterProvider'
    
    ($stateProvider, $urlRouterProvider) ->
        $urlRouterProvider.otherwise '/'
]

.controller 'AppCtrl', [
    '$location'
    '$scope'
    '$state'

    ($location, $scope, $state) ->

        $scope.uiState = $state

        # change of state affects pageTitle value
        $scope.$on '$stateChangeSuccess', (event, toState, toParams, fromState, fromParams) ->           
            if angular.isDefined toState.data.pageTitle
                $scope.pageTitle = "#{toState.data.pageTitle} | ЦНИИ РТК"

        # active CSS class handler
        $scope.isActive = (viewLocation) ->
            viewLocation is (do $location.path)
]


