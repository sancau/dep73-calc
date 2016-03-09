###
    Source: calculation/controllers/status-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for the calculation status panel
    Author: Alexander Tatchin | github.com/sancau
###

# controller function
StatusCtrl = ($scope, ActiveCalculation) ->

    # shared data object reference
    $scope.activeCalculation = ActiveCalculation

# controller registration
angular.module 'app.calculation'
    .controller 'StatusCtrl', [
        '$scope'
        'ActiveCalculation'

        StatusCtrl
    ] 