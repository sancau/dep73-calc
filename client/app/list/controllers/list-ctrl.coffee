###
    Source: list/controllers/list-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for the listview
    Author: Alexander Tatchin | github.com/sancau
###

ListCtrl = ($state, allCalculations, CalculationService) ->
    
    vm = this
    vm.calculationsList = allCalculations

    vm.showCalculation = (calculation) ->
        $state.go 'calculation', { calculationID: calculation._id }

    vm.delete = (calculation) -> 
        CalculationService.delete(calculation)
            .then(                        
                # success
                (data) ->  
                    vm.calculationsList.pop calculation
                # error
                (error) ->
                    console.log error
            )
        
    return vm

# controller registration
angular.module 'app.list'
.controller 'ListCtrl', [
    '$state'
    'allCalculations'
    'CalculationService'

    ListCtrl
]
