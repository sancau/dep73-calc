###
    Source: calculation/controllers/general-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for general information inputs section
    Author: Alexander Tatchin | github.com/sancau
###

# controller function
GeneralCtrl = ($scope) ->

    # TODO >> Should get select options from the configuration in DB
    # For now it's hardcoded
    $scope.options = [
        { 
            label: 'Квалификационные'
            value: '1'
        }
        { 
            label: 'Конструкторско-доводческие'
            value: '2'
        }
        { 
            label: 'Периодические'
            value: '3'
        }
        { 
            label: 'Приёмо-сдаточные'
            value: '4'
        }
        { 
            label: 'Предварительные'
            value: '5'
        }
        { 
            label: 'Типовые'
            value: '6'
        }
        { 
            label: 'Иное'
            value: '7'
        }
    ]

    # Save changes logic 
    $scope.saveChangesButtonContent = 'Сохранить' 
    $scope.saveChanges = () ->
        $scope.submitted = on

        if $scope.generalInfoForm.$valid
            console.log 'VALID FORM general ctrl saveChanges()'
        else
            console.log 'INVALID FORM general ctrl saveChanges()'

        # if $scope.generalInfoForm.$valid
        #     CalculationObject.name = $scope.generalInfoForm.name.$modelValue
        #     CalculationObject.type = $scope.generalInfoForm.type.$modelValue
        #     CalculationObject.doc = $scope.generalInfoForm.doc.$modelValue
        #     CalculationObject.comment = $scope.generalInfoForm.comment.$modelValue

    # Create new calculation logic
    $scope.createCalculationButtonContent = "Создать расчёт"
    $scope.createCalculation = () ->
        $scope.submitted = on

        if $scope.generalInfoForm.$valid
            console.log 'VALID FORM general ctrl createCalculation()'
        else
            console.log 'INVALID FORM general ctrl createCalculation()'

# controller registration
angular.module 'app.calculation'
    .controller 'GeneralCtrl', [
        '$scope'

        GeneralCtrl
    ]