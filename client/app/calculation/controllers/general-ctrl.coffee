###
    Source: calculation/controllers/general-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for general information inputs section
    Author: Alexander Tatchin | github.com/sancau
###

GeneralCtrl = (TypeOptions, Current) ->

    vm = this

    vm.typeOptions = TypeOptions.options

    # Copy of shared calculation 
    # Prevents general form from instantly changing status panel data before saved
    vm.formModel = JSON.parse JSON.stringify(Current.calculation.general)

    # Save changes logic 
    vm.saveChanges = () ->

        # Adds labels for type and preset to the data object
        vm.formModel.type.label = 
            (i.label for i in vm.typeOptions when i.value is vm.formModel.type.code)[0]

        vm.submitted = on

        if vm.generalInfoForm.$valid

            Current.calculation.general = JSON.parse JSON.stringify(vm.formModel)
            
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
    .controller 'GeneralCtrl', [
        'TypeOptions'
        'Current'

        GeneralCtrl
    ]