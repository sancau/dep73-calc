###
    Source: list/list.coffee 
    Project: dep73-calc
    Description: app.list module definition
    Author: Alexander Tatchin | github.com/sancau
###

angular.module 'app.list', [
    'ui.router'
]

.config [
    '$stateProvider'

    ($stateProvider) ->
        $stateProvider.state 'list',
            url: '/list'
            views: 
                'main':
                    controller: 'ListCtrl'
                    templateUrl: 'list/views/list-view.html'
            data:
                pageTitle: 'История расчётов'
]