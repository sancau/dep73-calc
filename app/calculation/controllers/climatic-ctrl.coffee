###
    Source: calculation/controllers/climatic-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for climatic tests inputs section
    Author: Alexander Tatchin | github.com/sancau
###

angular.module 'app.calculation'
.controller 'ClimaticCtrl', [
    '$scope',

    ($scope) ->

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

            # If 0 blocks will remain after deletion 
            # then a new blank block should be populated after deletion
            populateBlank = on if $scope.blocks.length is 1

            # Delete field group by index
            index = $scope.blocks.indexOf block
            $scope.blocks.splice index, 1

            # Populate a new blank field group if need
            $scope.blocks.push {} if populateBlank

        # TODO >> should get select options from the configuration in DB
        # For now it's hardcoded
        $scope.options = 
        [
            {   
                id: 1 
                name: 'Повышенная температура' 
                formView: 'calculation/views/climatic-partial/sub-partials/temperature-form.html'
            }
            { 
                id: 2 
                name: 'Пониженная температура' 
                formView: 'calculation/views/climatic-partial/sub-partials/temperature-form.html'
            }
            { 
                id: 3 
                name: 'Пониженная влажность' 
                formView: 'calculation/views/climatic-partial/sub-partials/humidity-form.html'
            }
            { 
                id: 4 
                name: 'Повышенная влажность' 
                formView: 'calculation/views/climatic-partial/sub-partials/humidity-form.html' 
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
]