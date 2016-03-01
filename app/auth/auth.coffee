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
            url: '/'
            views: 
                'main':
                    controller: 'AuthCtrl'
                    templateUrl: 'auth/views/auth-view.jade'
            data:
                pageTitle: 'Отдел №73'
]