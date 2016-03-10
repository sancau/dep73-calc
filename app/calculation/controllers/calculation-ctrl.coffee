###
    Source: calculation/controllers/calculation-ctrl.coffee 
    Project: dep73-calc
    Description: Root controller for a app.calculation 
        Purpose: Initialize ActiveCalculation object with the server data
        provided by CalculationResource
    Author: Alexander Tatchin | github.com/sancau
###

CalculationCtrl = ($scope, $stateParams, CalculationResource, ActiveCalculation) ->
    
    # current calculation as an integer
    $scope.id = parseInt $stateParams.calculationID
    
    # shared data object reference
    $scope.activeCalculation = ActiveCalculation

    # Storing the calculation in activeCalculation
    # TEMP use get instead with the real API
    CalculationResource.query()
        .$promise.then(
            # success
            (data) ->
                calculation = (i for i in data when i.id is $scope.id)[0]
                $scope.activeCalculation.data = calculation
            # error
            (error) ->
                console.log error
        )   

angular.module 'app.calculation'
.controller 'CalculationCtrl', [
        '$scope'
        '$stateParams'
        'CalculationResource'
        'ActiveCalculation'

        CalculationCtrl
    ]