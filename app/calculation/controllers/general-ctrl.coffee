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
                for i in data

                    $scope.presetOptions = []

                    presetOption = 
                        value: "#{i.id}"
                        label: i.name

                    $scope.presetOptions.push presetOption

                console.log "Presets loaded"
                console.log $scope.presetOptions

            # error
            (error) ->
                console.log error
        )

    console.log 'GeneralCtrl loaded'

    $scope.test = ActiveCalculation.data

    # shared data object reference
    $scope.activeCalculation = ActiveCalculation

    # Save changes logic 
    $scope.saveChangesButtonContent = 'Сохранить' 
    $scope.saveChanges = () ->

        $scope.submitted = on

        if $scope.generalInfoForm.$valid
            console.log 'VALID FORM general ctrl saveChanges()'

            # bind form data to the data object 
            # not to ActiveCalculation or $scope

            # update ActiveCalculation with the general data object
            # PUT ActiveCalculation
            # Reload Actual ?

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