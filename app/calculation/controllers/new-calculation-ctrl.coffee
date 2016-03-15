###
    Source: calculation/controllers/new-calculation-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for a new calculation initial form
    Author: Alexander Tatchin | github.com/sancau
###

NewCalculationCtrl = ($scope, ActiveCalculation) ->

    # Each form ctrl hosts data object for form model
    # on save this data object injects into activeCalculation object
    # then activeCalculation obj POST to server and reload activeCalculation 
    # with GET

    # Reset active calculation
    ActiveCalculation.data = ''

    # scope reference for active calculation
    $scope.activeCalculation = ActiveCalculation

    # Create new calculation logic
    $scope.createCalculationButtonContent = "Создать расчёт"
    $scope.createCalculation = () ->

        $scope.submitted = on

        if $scope.generalInfoForm.$valid
            console.log 'VALID FORM new calc ctrl createCalculation()'

            # create new calculation in DB via POST on API endpoint

            # GET new calculation as ActiveCalculation
            # Redirect to calculation/{{new-calc-id}}
        else
            console.log 'INVALID FORM new calc ctrl createCalculation()'


# controller registration
angular.module 'app.calculation'
    .controller 'NewCalculationCtrl', [
        '$scope'
        'ActiveCalculation'

        NewCalculationCtrl
    ]