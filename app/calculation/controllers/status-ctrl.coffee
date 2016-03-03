###
    Source: calculation/controllers/status-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for the calculation status panel
    Author: Alexander Tatchin | github.com/sancau
###

# controller function
StatusCtrl = ($scope, CalculationObject) ->

    # Reference to the shared calculation object via service
    $scope.calculation = CalculationObject


# controller registration
angular.module 'app.calculation'
    .controller 'StatusCtrl', [
        '$scope'
        'CalculationObject'

        StatusCtrl
    ] 