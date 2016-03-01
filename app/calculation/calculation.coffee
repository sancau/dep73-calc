###
    Source: calculation/calculation.coffee 
    Project: dep73-calc
    Description: app.calculation module definition
    Author: Alexander Tatchin | github.com/sancau
###

angular.module 'app.calculation', [
    'ui.router'
    'ui.bootstrap'
]

.config [
    '$stateProvider'

    ($stateProvider) ->
        $stateProvider.state 'calculation',
            url: '/calculation'
            views: 
                'main':
                    controller: 'ClimaticCtrl'
                    templateUrl: 'calculation/views/calculation-view.jade'
            data:
                pageTitle: 'Расчёт трудоёмкости'
]