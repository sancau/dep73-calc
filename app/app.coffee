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
    'dm.stickyNav' #move this dependency to calculation module?

    'lc.directives'

    'app.views'
    'app.auth'
    'app.list'
    'app.calculation'
    'app.settings'
]
.config [
    '$stateProvider'
    '$urlRouterProvider'
    
    ($stateProvider, $urlRouterProvider) ->
        $urlRouterProvider.otherwise '/'
]
