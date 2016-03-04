###
    Source: calculation/controllers/status-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for the calculation status panel
    Author: Alexander Tatchin | github.com/sancau
###

# controller function
StatusCtrl = ($scope) ->


# controller registration
angular.module 'app.calculation'
    .controller 'StatusCtrl', [
        '$scope'

        StatusCtrl
    ] 