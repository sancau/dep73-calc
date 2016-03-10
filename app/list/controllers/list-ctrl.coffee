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
    $scope.calculationsList =  CalculationResource.query()

    # logic on listview row click
    # goes to the certain calculation view state
    $scope.showCalculation = (calculation) ->
        console.log "going to #{calculation.general.name} page"

        $state.go 'calculation', { calculationID: calculation.id }


# controller registration
angular.module 'app.list'
.controller 'ListCtrl', [
    '$scope'
    '$state'
    'CalculationResource'

    ListCtrl
]
