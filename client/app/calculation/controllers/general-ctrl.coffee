###
    Source: calculation/controllers/general-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for general information inputs section
    Author: Alexander Tatchin | github.com/sancau
###

GeneralCtrl = ($scope, ActiveCalculation, CalculationAPI, TypeOptions) ->

    $scope.activeCalculation = ActiveCalculation
    $scope.typeOptions = TypeOptions.options

    $scope.formModel = JSON.parse JSON.stringify(ActiveCalculation.data.general)

    # Save changes logic 
    $scope.saveChanges = () ->
        
        # Adds labels for type and preset to the data object
        $scope.formModel.type.label = 
            (i.label for i in $scope.typeOptions when i.value is $scope.formModel.type.code)[0]

        $scope.submitted = on

        if $scope.generalInfoForm.$valid

            ActiveCalculation.data.general = JSON.parse JSON.stringify($scope.formModel)
            calculation = $scope.activeCalculation.data          

            CalculationAPI.one(calculation._id).get()
                .then(
                    (entity) ->
                        for prop, value of entity
                            entity[prop] = value
                        entity.save()
                            .then(
                                (updatedEntity) ->
                                    # update ActiveCalculation
                                    for prop, value of updatedEntity
                                        ActiveCalculation.data[prop] = value
                                (error) ->
                                    console.log error
                            )
                    (error) ->
                        console.log error
                )
        else
            console.log 'Invalid Form'

# controller registration
angular.module 'app.calculation'
    .controller 'GeneralCtrl', [
        '$scope'
        'ActiveCalculation'
        'CalculationAPI'
        'TypeOptions'

        GeneralCtrl
    ]