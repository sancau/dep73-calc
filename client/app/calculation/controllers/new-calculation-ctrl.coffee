###
    Source: calculation/controllers/new-calculation-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for a new calculation initial form
    Author: Alexander Tatchin | github.com/sancau
###

NewCalculationCtrl = ($state, CalculationAPI, TypeOptions) ->

    vm = this

    vm.formModel = {}
    vm.typeOptions = TypeOptions.options

    # Create new calculation logic
    vm.createCalculation = () ->

        vm.submitted = on

        if vm.generalInfoForm.$valid

            # Adds type label and preset label to data objects
            vm.formModel.type.label = 
                (i.label for i in vm.typeOptions when i.value is vm.formModel.type.code)[0]
        
            # Populates data object using entered data from fromModel
            data = 
                meta: {
                    author: 'USER AUTHORIZATION NOT IMPLEMENTED'
                    created: new Date()
                    edited: new Date()
                    completed: false
                }
                general: vm.formModel
                climatic: {
                    blocks: []
                }

            CalculationAPI.post(data)
                .then(
                        # success
                        (newEntity) ->
                            $state.go 'calculation', { calculationID: newEntity._id }
                        # error
                        (error) ->
                            console.log error
                )

        else
            console.log 'Form Invalid'

    return vm

# Controller registration
angular.module 'app.calculation'
    .controller 'NewCalculationCtrl', [
        '$state'
        'CalculationAPI'
        'TypeOptions'

        NewCalculationCtrl
    ]