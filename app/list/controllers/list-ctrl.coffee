###
    Source: list/controllers/list-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for the listview
    Author: Alexander Tatchin | github.com/sancau
###

# controller function
ListCtrl = ($scope, $state, CalculationResource) ->

    # gets list of calculations from the CalculationResource service
    # and attaches the date to the controller scope 
    $scope.listCollection =  CalculationResource.query()

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
    'CalculationResource'

    ListCtrl
]
