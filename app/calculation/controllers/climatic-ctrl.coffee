###
    Source: calculation/controllers/climatic-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for climatic tests inputs section
    Author: Alexander Tatchin | github.com/sancau
###

# controller function
ClimaticCtrl = ($scope) ->

    # Initial array of field groups contains 1 blank block
    $scope.blocks = [{}]

    # Returns a verbose name for a block to display
    $scope.getName = ($index) ->
        "Блок #{$index}"

    # Add block logic
    $scope.clone = () ->
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
    $scope.OnSubmit = () ->
        $scope.submitted = on

        ###
            General info should be already submitted
            Else cance submission of climatic and notify user

            If report object exists
            Save progress in db
            
            Update status panel
        ###

# controller registration
angular.module 'app.calculation'
    .controller 'ClimaticCtrl', [
        '$scope'

        ClimaticCtrl
    ]