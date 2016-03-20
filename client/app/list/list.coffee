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
        'CalculationService'

        (CalculationService) ->
            
            CalculationService.getAll()
                .then(
                    # success
                    (data) -> 
                        data._items
                    # error
                    (error) ->
                        console.log error
                )
    ]
