###
    Source: calculation/calculation.coffee 
    Project: dep73-calc
    Description: app.calculation module definition
    Author: Alexander Tatchin | github.com/sancau
###

angular.module 'app.calculation', [
    'ui.router'
    'ui.bootstrap'
    
    'dm.stickyNav' 
]

.config [
    '$stateProvider'

    ($stateProvider) ->

        $stateProvider
        
            #state for an existing calculation
            .state 'calculation',
                url: '/calculation/:calculationID'
                views: 
                    'main':
                        controller: 'CalculationCtrl'
                        templateUrl: 'calculation/views/calculation-view.jade'
                data:
                    pageTitle: 'Расчёт трудоёмкости'

            #state for a new calculation
            .state 'calculation-new',
                url: '/calculation'
                views:
                    'main':
                        controller: 'NewCalculationCtrl'
                        templateUrl: 'calculation/views/calculation-new-view.jade'
                data:
                    pageTitle: 'Новый расчёт трудоёмкости'
]                        