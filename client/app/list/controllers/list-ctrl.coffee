###
    Source: list/controllers/list-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for the listview
    Author: Alexander Tatchin | github.com/sancau
###

# controller function
ListCtrl = ($state, allCalculations, CalculationResource) ->
    
    vm = this
    
    vm.calculationsList = allCalculations

    # logic on listview row click
    # goes to the certain calculation view state
    vm.showCalculation = (calculation) ->
        
        console.log "going to #{calculation.general.name} page"

        $state.go 'calculation', { calculationID: calculation._id }

    vm.delete = (calculation) -> 

        console.log calculation._etag

        # get calculation entity
        CalculationResource.etag(calculation._etag).get({ id: calculation._id })
            .$promise.then(
                # success
                (entity) ->

                    entity.$delete(
                            # success
                            (data) ->
                                console.log data

                            # error
                            (error) ->
                                console.log error
                        )

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
    'CalculationResource'

    ListCtrl
]
