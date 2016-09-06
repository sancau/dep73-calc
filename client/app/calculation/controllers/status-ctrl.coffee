###
    Source: calculation/controllers/status-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for the calculation status panel
    Author: Alexander Tatchin | github.com/sancau
###

# controller function
StatusCtrl = (Current) ->

    vm = this

    # shared data object reference
    vm.currentCalculation = Current.calculation
    vm.current = Current

    # view is binded to the ActiveCalculation object 
    # lets user to monitor current calculation parameters and results    

    return vm 

# controller registration
angular.module 'app.calculation'
    .controller 'StatusCtrl', [
        'Current'

        StatusCtrl
    ] 