###
    Source: list/controllers/list-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for the listview
    Author: Alexander Tatchin | github.com/sancau
###

# controller function
ListCtrl = ($state, CalculationResource) ->
    
    vm = this
    
    # gets list of calculations from the CalculationResource service
    # and attaches the date to the controller scope 
    vm.calculationsList =  CalculationResource.query()

    # logic on listview row click
    # goes to the certain calculation view state
    vm.showCalculation = (calculation) ->
        console.log "going to #{calculation.general.name} page"

        $state.go 'calculation', { calculationID: calculation.id }

    return vm

# controller registration
angular.module 'app.list'
.controller 'ListCtrl', [
    '$state'
    'CalculationResource'

    ListCtrl
]
