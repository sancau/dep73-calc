###
    Source: calculation/controllers/new-calculation-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for a new calculation initial form
    Author: Alexander Tatchin | github.com/sancau
###

NewCalculationCtrl = ($scope, $http, ActiveCalculation, PresetsResource) ->

    # Each form ctrl hosts data object for form model
    # on save this data object injects into activeCalculation object
    # then activeCalculation obj POST to server and reload activeCalculation 
    # with GET

    # Reset active calculation
    ActiveCalculation.data = ''

    # scope reference for active calculation
    $scope.activeCalculation = ActiveCalculation
    $scope.formModel = {}

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

    # Create new calculation logic
    $scope.createCalculationButtonContent = "Создать расчёт"
    $scope.createCalculation = () ->

        $scope.submitted = on

        if $scope.generalInfoForm.$valid
            console.log 'VALID FORM new calc ctrl createCalculation()'

            # adds type label and preset label to data objects
            $scope.formModel.type.label = 
                (i.label for i in ActiveCalculation.typeOptions when i.value is $scope.formModel.type.code)[0]
            $scope.formModel.settings.label = 
                (i.label for i in $scope.presetOptions when i.value is $scope.formModel.settings.code)[0]

            newCalculation = 
                meta: { 
                    completed: false
                }
                general: $scope.formModel
                climatic: {
                    blocks: []
                }


            data = JSON.stringify newCalculation

            # DEVELOPMENT ONLY

            $http.post('http://127.0.0.1:8000/api/v1/calculation', data)
                .success(
                        (data,status) ->
                            console.log data
                            console.log status
                    )
                .error(
                        (error) ->
                            console.log error
                    )
            # create new calculation in DB via POST on API endpoint
            # GET new calculation as ActiveCalculation
            # Redirect to calculation/{{new-calc-id}}

            console.log "LOGIC TO CREATE NEW CALC WITH THIS DATA:"
            console.log data

        else
            console.log 'INVALID FORM new calc ctrl createCalculation()'


# controller registration
angular.module 'app.calculation'
    .controller 'NewCalculationCtrl', [
        '$scope'
        '$http' #remove
        'ActiveCalculation'
        'PresetsResource'

        NewCalculationCtrl
    ]