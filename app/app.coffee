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

    'lc.directives' # custom application directives

    'app.views' # cached templates module 

    'app.auth' # user athentication and authorization
    'app.list' # depricate / merge with app.calculation?   
    'app.calculation' # calculations list / view / create / manage
    'app.settings' # calculation settings preset manager
]
.config [
    '$stateProvider'
    '$urlRouterProvider'
    
    ($stateProvider, $urlRouterProvider) ->
        $urlRouterProvider.otherwise '/'
]
