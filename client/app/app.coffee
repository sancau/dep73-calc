###
    Source: app.coffee 
    Project: dep73-calc
    Description: Main application module
    Author: Alexander Tatchin | github.com/sancau
###

angular.module 'app', [
    'app.auth'
    'app.directives' 
    'app.calculation' 
    'app.preset'
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
        vm = this
        vm.goList = ->
            if $state.current.name is 'list' then return
            else
                if window.confirm('Закрыть текущий отчет? Все несохраненные изменения будут потеряны!')
                   $state.go 'list'

        vm.uiState = $state

        # change of state affects pageTitle value
        $scope.$on '$stateChangeSuccess', (event, toState, toParams, fromState, fromParams) ->           
            if angular.isDefined toState.data.pageTitle
                $scope.pageTitle = "#{toState.data.pageTitle} | ЦНИИ РТК"

        # active CSS class handler
        vm.isActive = (viewLocation) ->
            viewLocation is (do $location.path)

        return vm
]


