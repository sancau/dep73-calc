###
    Source: list/controllers/list-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for the listview
    Author: Alexander Tatchin | github.com/sancau
###

angular.module 'app.list'
.controller 'ListCtrl', [
    '$scope',

    ($scope) ->
        $scope.testvar = "История расчётов"
]
