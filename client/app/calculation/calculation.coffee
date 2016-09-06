###
    Source: calculation/calculation.coffee 
    Project: dep73-calc
    Description: app.calculation module definition
    Author: Alexander Tatchin | github.com/sancau
###

angular.module 'app.calculation', [
    'ui.router'
    'ui.bootstrap'
    'ngAnimate'
    'dm.stickyNav' 

    'api'
]   

.config [
    '$stateProvider'

    ($stateProvider) ->

        $stateProvider

            # Calculations list
            .state 'list',
                url: '/'
                views: 
                    'main':
                        controller: 'ListCtrl as list'
                        templateUrl: 'calculation/views/list-view.jade'
                        resolve: listPreload
                data:
                    pageTitle: 'История расчётов'

            # Report preview
            .state 'report',
                url: '/report/:calculationID'
                views:
                    'main':
                        controller: 'ReportPreviewCtrl as report'
                        templateUrl: 'calculation/views/report-view.jade'
                        resolve: calculationPreload
                data:
                    pageTitle: 'Просмотр отчёта'
        
            # Existing calculation
            .state 'calculation',
                url: '/calculation/:calculationID'
                views: 
                    'main':
                        templateUrl: 'calculation/views/calculation-view.jade'
                        resolve: calculationPreload
                data:
                    pageTitle: 'Расчёт трудоёмкости'

            # New calculation
            .state 'calculation-new',
                url: '/calculation'
                views:
                    'main':
                        controller: 'NewCalculationCtrl as general'
                        templateUrl: 'calculation/views/calculation-new-view.jade'
                data:
                    pageTitle: 'Новый расчёт трудоёмкости'
]

# This preloads calculation data to feed ActiveCalculation object 
calculationPreload = 
    preload: [
        '$stateParams'
        'CalculationAPI'
        'Current'

        ($stateParams, CalculationAPI, Current) ->

            id = $stateParams.calculationID

            CalculationAPI.one(id).get()
                .then(
                    (data) ->
                        Current.calculation = data
                    (error) ->
                        console.log error
                )
    ]

# This preloads calculations data before list ctrl is loaded
listPreload = 
    allCalculations: [
        'CalculationAPI'

        (CalculationAPI) ->    
            CalculationAPI.getList()
                .then(
                    (data) ->
                        data.plain()
                    (error) ->
                        console.log error
                )
    ]