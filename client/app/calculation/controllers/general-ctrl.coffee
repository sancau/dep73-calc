###
    Source: calculation/controllers/general-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for general information inputs section
    Author: Alexander Tatchin | github.com/sancau
###

# controller function
GeneralCtrl = ($scope, ActiveCalculation, CalculationResourceEtag, PresetsResource) ->

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

            CalculationResourceEtag.etag(data._etag)
                .get({ id: data._id })
                    .$promise.then(
                        # success
                        (entity) ->

                            # adds changes to the instance
                            for prop, value of data.general
                                entity.general[prop] = value

                            # ISSUE | NOT CRITICAL
                            # should remove meta fields from entity to pass server validation
                            # eve framework pitfall? 
                            for i in ['_created', '_etag', '_links', '_updated']
                                delete entity[i]

                            # push to the server
                            entity.$update(
                                    # success
                                    (updatedEntity) ->

                                        # update ActiveCalculation with new META
                                        for prop, value of updatedEntity
                                            ActiveCalculation.data[prop] = value

                                    # error
                                    (error) ->
                                        console.log error
                                )

                        # error
                        (error) ->
                            console.log error
                    )
        else
            console.log 'INVALID FORM general ctrl saveChanges()'

# controller registration
angular.module 'app.calculation'
    .controller 'GeneralCtrl', [
        '$scope'
        'ActiveCalculation'
        'CalculationResourceEtag'
        'PresetsResource'

        GeneralCtrl
    ]