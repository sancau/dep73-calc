###
    Source: list/controllers/list-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for the listview
    Author: Alexander Tatchin | github.com/sancau
###

# controller function
ListCtrl = ($scope) ->

    # test stub. shoulc use service to call the API and 
    # return the list
    $scope.listCollection = [
        {
            name: "Кактус 2В"
            type: "Типовые"
            author: "Ксенофонтов Б.А."
        }
        {
            name: "Шакал"
            type: "Периодические"
            author: "Кандлин Л.А."
        }
        {
            name: "Теодолит"
            type: "Периодические"
            author: "Беляев Н.Н."
        }
        {
            name: "Стример"
            type: "Пуско-наладочные"
            author: "Комаров С.В."
        }       
    ]

    # logic on listview row click
    # goes to the certain calculation view state
    $scope.showCalculation = (calculation) ->
        window.alert calculation.name


# controller registration
angular.module 'app.list'
.controller 'ListCtrl', [
    '$scope'

    ListCtrl
]
