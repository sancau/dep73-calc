###
    Source: calculation/controllers/climatic-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for climatic tests inputs section
    Author: Alexander Tatchin | github.com/sancau
###

# controller function
ClimaticCtrl = ($scope, ActiveCalculation) ->

    # shared data object reference
    $scope.activeCalculation = ActiveCalculation

    ###
        TODO 
        addBlock BTN and deleteBlock BTN visibility logic
    ###

    # Initial array of field groups contains 1 blank block
    $scope.blocks = [{}]

    # Returns a verbose name for a block to display
    $scope.getName = ($index) ->
        "Блок #{$index}"

    # Add block logic
    $scope.clone = () ->

        # if no data entered in existing block user cant add another 
        hasEmptyBlock = no
        for block in $scope.blocks
            if not block.selectedOption
                hasEmptyBlock = yes
        if hasEmptyBlock then return console.log "there's an empty block to use | ClimaticCtrl clone()"

        # If form structure changed after submit attempt the state resets
        $scope.submitted = off
        $scope.blocks.push {}

    # Delete block logic
    $scope.delete = (block) ->
        # If form structure changed after submit attempt the state resets
        $scope.submitted = off

        # Delete field group by index
        index = $scope.blocks.indexOf block
        $scope.blocks.splice index, 1

        # If 0 blocks remains after deletion 
        # then a new blank block should be populated after deletion
        $scope.blocks.push {} if $scope.blocks.length is 0

    # TODO >> should get select options from the configuration in DB
    # For now it's hardcoded
    $scope.options = 
    [
        {   
            id: 1 
            name: 'Повышенная температура' 
            formView: 'calculation/views/climatic-partial/sub-partials/temperature-form.jade'
        }
        { 
            id: 2 
            name: 'Пониженная температура' 
            formView: 'calculation/views/climatic-partial/sub-partials/temperature-form.jade'
        }
        { 
            id: 3 
            name: 'Пониженная влажность' 
            formView: 'calculation/views/climatic-partial/sub-partials/humidity-form.jade'
        }
        { 
            id: 4 
            name: 'Повышенная влажность' 
            formView: 'calculation/views/climatic-partial/sub-partials/humidity-form.jade' 
        }
        { 
            id: 5 
            name: 'Технологическая операция' 
            formView: 'calculation/views/climatic-partial/sub-partials/operation-form.jade' 
        }
    ]

    # Logic on climatic data submission
    $scope.saveChangesButtonContent = 'Сохранить' 
    $scope.saveChanges = () ->

        # flag signals that form was submitted by the user
        $scope.submitted = on

        # check each block of form to be valid 
        dataValid = yes
        for block in $scope.blocks 
            if not block.climaticForm.$valid
                dataValid = no

        # depending on the validation status perform proper logic
        if dataValid
            # TODO save changes logic
            console.log "Save changes logic to go | ClimaticCtrl.saveChanges()"
        else
            # TODO handle the validation error
            console.log "Form is invalid | ClimaticCtrl.saveChanges()"

# controller registration
angular.module 'app.calculation'
    .controller 'ClimaticCtrl', [
        '$scope'
        'ActiveCalculation'

        ClimaticCtrl
    ]