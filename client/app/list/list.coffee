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
            url: '/'
            views: 
                'main':
                    controller: 'ListCtrl as list'
                    templateUrl: 'list/views/list-view.jade'
                    resolve: calculationsPreload
            data:
                pageTitle: 'История расчётов'
]

# this preloads calculations data before ctrl is loaded
calculationsPreload = 
    allCalculations: [
        'CalculationResource'

        (CalculationResource) ->

            # Storing the calculation in activeCalculation
            # TEMP use get instead with the real API
            CalculationResource.query()
                .$promise.then(
                    # success
                    (data) ->

                        console.log data._items 
                        console.log "Calculations preloaded"

                        return data._items


                    # error
                    (error) ->
                        console.log error
                )
    ]