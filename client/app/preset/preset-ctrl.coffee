###
    Source: preset/preset-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for the preset view
    Author: Alexander Tatchin | github.com/sancau
###

# controller 
PresetCtrl = (PresetAPI) ->
    vm = this

    # get list of all presets in db
    PresetAPI.getList()
        .then(
            (data) ->
                vm.presets = data.plain()
            (error) ->
                console.log error
        )

    return vm

# controller registration
angular.module 'app.preset'
.controller 'PresetCtrl', [
    'PresetAPI'

    PresetCtrl
]
