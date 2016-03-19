###
    Source: calculation/controllers/new-calculation-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for a new calculation initial form
    Author: Alexander Tatchin | github.com/sancau
###

NewCalculationCtrl = ($scope, $state, ActiveCalculation, CalculationResource, PresetsResource) ->

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
            # DEBUG
            console.log 'VALID FORM new calc ctrl createCalculation()'

            # adds type label and preset label to data objects
            $scope.formModel.type.label = 
                (i.label for i in ActiveCalculation.typeOptions when i.value is $scope.formModel.type.code)[0]
            $scope.formModel.settings.label = 
                (i.label for i in $scope.presetOptions when i.value is $scope.formModel.settings.code)[0]

            # populates data object using entered data from fromModel
            data = 
                meta: { 
                    completed: false
                }
                general: $scope.formModel
                climatic: {
                    blocks: []
                }

            # creates resource instance
            entity = new CalculationResource
            console.log entity

            # adds data to the instance
            for prop, value of data
                entity[prop] = value
            

            # push to the server
            entity.$save(
                    # success
                    (newEntity) ->
                        # redirect to the created calculation view
                        $state.go 'calculation', { calculationID: newEntity._id }
                    # error
                    (error) ->
                        console.log error
                )

        else
            console.log 'INVALID FORM new calc ctrl createCalculation()'


# controller registration
angular.module 'app.calculation'
    .controller 'NewCalculationCtrl', [
        '$scope'
        '$state' 
        'ActiveCalculation'
        'CalculationResource'
        'PresetsResource'

        NewCalculationCtrl
    ]