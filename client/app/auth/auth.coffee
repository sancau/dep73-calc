###
    Source: auth/auth.coffee 
    Project: dep73-calc
    Description: app.auth module definition
    Author: Alexander Tatchin | github.com/sancau
###

angular.module 'app.auth', [
    'ui.router'
]

.config [
    '$stateProvider'

    ($stateProvider) ->
        $stateProvider.state 'auth',
            url: '/login'
            views: 
                'main':
                    controller: 'AuthCtrl'
                    controllerAs: 'auth'
                    templateUrl: 'auth/auth-view.jade'
            data:
                pageTitle: 'Отдел №73'
]