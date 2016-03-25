###
    Source: calculation/controllers/new-calculation-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for a new calculation initial form
    Author: Alexander Tatchin | github.com/sancau
###

NewCalculationCtrl = ($scope, $state, CalculationAPI, TypeOptions) ->

    $scope.formModel = {}
    $scope.typeOptions = TypeOptions.options

    # Create new calculation logic
    $scope.createCalculation = () ->

        $scope.submitted = on

        if $scope.generalInfoForm.$valid

            # Adds type label and preset label to data objects
            $scope.formModel.type.label = 
                (i.label for i in $scope.typeOptions when i.value is $scope.formModel.type.code)[0]
        
            # Populates data object using entered data from fromModel
            data = 
                meta: {
                    author: 'USER AUTHORIZATION NOT IMPLEMENTED'
                    created: new Date()
                    edited: new Date()
                    completed: false
                }
                general: $scope.formModel
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

# Controller registration
angular.module 'app.calculation'
    .controller 'NewCalculationCtrl', [
        '$scope'
        '$state'
        'CalculationAPI'
        'TypeOptions'

        NewCalculationCtrl
    ]