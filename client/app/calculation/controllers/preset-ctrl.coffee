PresetCtrl = (Current, LogicService) ->
    vm = this
    # Copy of shared calculation
    # Prevents preset form from instantly changing status panel data before saved
    if not Current.calculation.meta.preset?
        Current.calculation.meta.preset =
            upSpeed: 1
            downSpeed: 1
            nuTemp: 22
            nuHum: 50
    vm.formModel = JSON.parse JSON.stringify(Current.calculation.meta.preset)
    vm.formModel.preparationLabor = Current.calculation.additional.preparationLabor
    # Save changes logic
    vm.saveChanges = () ->
        vm.submitted = on
        if vm.presetForm.$valid
            Current.calculation.meta.preset = JSON.parse JSON.stringify(vm.formModel)
            Current.calculation.additional.preparationLabor = vm.formModel.preparationLabor
            Current.calculation = LogicService.evaluate(Current.calculation)
            Current.calculation.save()
                .then(
                    (data) ->
                        console.log data
                    (error) ->
                        console.log error
                )
    return vm

# controller registration
angular.module 'app.calculation'
    .controller 'PresetCtrl', [
        'Current'
        'LogicService'
        PresetCtrl
    ]
