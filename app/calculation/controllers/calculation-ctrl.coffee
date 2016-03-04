###
    Source: calculation/controllers/calculation-ctrl.coffee 
    Project: dep73-calc
    Description: Host controller for the calculation view 
    Author: Alexander Tatchin | github.com/sancau
###

# controller function
CalculationCtrl = ($scope) ->

    $scope.onSubmit = () ->
        $scope.submitted = on

# controller registration
angular.module 'app.calculation'
    .controller 'CalculationCtrl', [
        '$scope'

        CalculationCtrl
    ] 