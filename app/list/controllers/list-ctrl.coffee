###
    Source: list/controllers/list-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for the listview
    Author: Alexander Tatchin | github.com/sancau
###

# controller function
ListCtrl = ($scope, $state) ->

    # test stub. shoulc use service to call the API and 
    # return the list
    $scope.listCollection = [
        {
            name: "Кактус 2В"
            type: "Типовые"
            author: "Ксенофонтов Б.А."
            edited: "14.04.2015"
        }
        {
            name: "Шакал"
            type: "Периодические"
            author: "Кандлин Л.А."
            edited: "25.02.2016"            
        }
        {
            name: "Теодолит"
            type: "Периодические"
            author: "Беляев Н.Н."
            edited: "21.12.2015"
        }
        {
            name: "Стример"
            type: "Пуско-наладочные"
            author: "Комаров С.В."
            edited: "02.03.2016"
        }       
    ]

    # logic on listview row click
    # goes to the certain calculation view state
    $scope.showCalculation = (calculation) ->
        console.log "going to #{calculation.name} page"

        $state.go('calculation')


# controller registration
angular.module 'app.list'
.controller 'ListCtrl', [
    '$scope'
    '$state'

    ListCtrl
]
