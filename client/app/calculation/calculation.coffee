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
        
            # an existing calculation
            .state 'calculation',
                url: '/calculation/:calculationID'
                views: 
                    'main':
                        templateUrl: 'calculation/views/calculation-view.jade'
                        resolve: calculationPreload
                data:
                    pageTitle: 'Расчёт трудоёмкости'

            # a new calculation
            .state 'calculation-new',
                url: '/calculation'
                views:
                    'main':
                        controller: 'NewCalculationCtrl'
                        templateUrl: 'calculation/views/calculation-new-view.jade'
                data:
                    pageTitle: 'Новый расчёт трудоёмкости'
]

# this preloads calculation data to feed ActiveCalculation object 
# before calculation page and inner ctrls are loaded
calculationPreload = 
    preload: [
        'CalculationResource'
        'ActiveCalculation'
        '$stateParams'

        (CalculationResource, ActiveCalculation, $stateParams) ->

            id = $stateParams.calculationID
            console.log id

            # get calculation entity
            CalculationResource
                .get({ id: id })
                    .$promise.then(
                        # success
                        (data) ->

                            console.log data
                            ActiveCalculation.data = data

                            console.log "Caclulation Data Preloaded"

                        # error
                        (error) ->
                            console.log error
                    )
    ]