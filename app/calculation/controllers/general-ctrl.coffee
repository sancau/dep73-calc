###
    Source: calculation/controllers/general-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for general information inputs section
    Author: Alexander Tatchin | github.com/sancau
###

# controller function
GeneralCtrl = ($scope, ActiveCalculation) ->

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
        else
            console.log 'INVALID FORM general ctrl saveChanges()'

# controller registration
angular.module 'app.calculation'
    .controller 'GeneralCtrl', [
        '$scope'
        'ActiveCalculation'

        GeneralCtrl
    ]