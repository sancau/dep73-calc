###
    Source: calculation/controllers/general-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for general information inputs section
    Author: Alexander Tatchin | github.com/sancau
###

# controller function
GeneralCtrl = ($scope, ActiveCalculation, PresetsResource) ->

    PresetsResource.query()
        .$promise.then(
            # success
            (data) ->

                $scope.presetOptions = []

                for i in data

                    presetOption = 
                        value: "#{i.id}"
                        label: i.name

                    $scope.presetOptions.push presetOption

                console.log "Presets loaded"
            # error
            (error) ->
                console.log error
        )

    console.log 'GeneralCtrl loaded'

    # shared data object reference
    $scope.activeCalculation = ActiveCalculation

    $scope.formModel = JSON.parse JSON.stringify(ActiveCalculation.data.general)

    # Save changes logic 
    $scope.saveChangesButtonContent = 'Сохранить' 
    $scope.saveChanges = () ->
        
        # adds labels for type and preset to the data object
        $scope.formModel.type.label = 
            (i.label for i in ActiveCalculation.typeOptions when i.value is $scope.formModel.type.code)[0]
        $scope.formModel.settings.label = 
                (i.label for i in $scope.presetOptions when i.value is $scope.formModel.settings.code)[0]

        $scope.submitted = on

        if $scope.generalInfoForm.$valid

            ActiveCalculation.data.general = JSON.parse JSON.stringify($scope.formModel)
            data = $scope.activeCalculation.data

            console.log 'LOGIC TO SAVE THIS DATA:'
            console.log data

        else
            console.log 'INVALID FORM general ctrl saveChanges()'

# controller registration
angular.module 'app.calculation'
    .controller 'GeneralCtrl', [
        '$scope'
        'ActiveCalculation'
        'PresetsResource'

        GeneralCtrl
    ]