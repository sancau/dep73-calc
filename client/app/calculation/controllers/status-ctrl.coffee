###
    Source: calculation/controllers/status-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for the calculation status panel
    Author: Alexander Tatchin | github.com/sancau
###

# controller function
StatusCtrl = (ActiveCalculation) ->

    console.log 'StatusCtrl loaded'

    vm = this

    # shared data object reference
    vm.activeCalculation = ActiveCalculation

    # view is binded to the ActiveCalculation object 
    # lets user to monitor current calculation parameters and results    

    return vm 

# controller registration
angular.module 'app.calculation'
    .controller 'StatusCtrl', [
        'ActiveCalculation'

        StatusCtrl
    ] 